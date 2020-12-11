#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Distribution Certificate
# @raycast.mode fullOutput
# @raycast.packageName Flagship
#
# Optional parameters:
# @raycast.icon flagship.png
# @raycast.currentDirectoryPath ~/certs

set -euo pipefail

# Target password
readonly password=$(zenity --password --title=Authentication)

# Authenticate
readonly token=$(
				curl -s https://prod.vault.target.com/v1/auth/ldap/login/z013sbd -X POST \
  					--data "{\"password\": \"$password\" }" \
  					| jq -r '.auth.client_token'
				)

# Upload the new certificate, which is any *p12 in the directory

if [[ ! $(ls|wc -l) -eq 1 ]]; then
  echo "More than one file in the ~/certs directory"
  exit 1
fi

readonly newExpiry=$(openssl pkcs12 -passin pass: -in *.p12 -nodes \
						| openssl x509 -noout -enddate)
echo "Expiry of pending certificate: $newExpiry"

# Wrap certificate in JSON payload
base64 *.p12 | jq -Rn 'input as $cert | { cert_base64: $cert }' > cert64json

# Upload new certificate
curl -s https://prod.vault.target.com/v1/secret/ios_appstore/distribution \
	-H "X-Vault-Token: $token" \
	-H "Content-Type: application/json" \
	-X POST --data @cert64json

# Verify the cert was uploaded, by fetching and comparing with the cert uploaded

# Fetch the certificate just uploaded.
curl -s https://prod.vault.target.com/v1/secret/ios_appstore/distribution \
	-H "X-Vault-Token: $token" \
	| jq -r '.data.cert_base64' \
	| base64 --decode > certout.p12
	
# Validate the expiration date of the recently fetched cert.
#
# `-passin pass:` = Sending in an empty password (these are not password protected)
readonly validatedExpiry=$(openssl pkcs12 -passin pass: -in certout.p12 -nodes \
	| openssl x509 -noout -enddate)
echo "Expiry of pending certificate: $validatedExpiry"

# Cleanup
rm cert64json
rm certout.p12


if [[ ! $(ls|wc -l) -eq 1 ]]; then
  echo "WARNING: Intermediate files not cleaned up."
  exit 1
fi