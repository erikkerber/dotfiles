function sapphire
  curl \
  -H 'Host: sapphire-api.target.com' \
  -H 'Cookie: egsSessionId=d039d940-f7ec-4b68-a3c3-6825d95590f1; TealeafAkaSid=h2z-iV4MVmXw2qzadhjB5fxYNENaWbKB' \
  -H 'accept: */*' \
  -H 'user-agent: Target/0 CFNetwork/1121.2.1 Darwin/19.2.0' \
  -H 'accept-language: en-us' \
  --compressed 'https://sapphire-api.target.com/sapphire/runtime/api/v1/qualified-experiments?os_family=iOS&app_version=2020.12&in_store=true&app_name=Target&longitude=-86.637000&device=x86_64&tm=true&visitor_id=0170d979860f0104D23AAE69B5F44CC0&latitude=33.605000&channel=apps&member_id=523239241&os_version=13.3&redcard_holder=true&source=flagship_ios' \
  | jq \
  | grep featureVersions

  curl \
  -H 'Host: sapphire-api.target.com' \
  -H 'Cookie: egsSessionId=d039d940-f7ec-4b68-a3c3-6825d95590f1; TealeafAkaSid=h2z-iV4MVmXw2qzadhjB5fxYNENaWbKB' \
  -H 'accept: */*' \
  -H 'cache-control: no-cache' \
  -H 'user-agent: Target/0 CFNetwork/1121.2.1 Darwin/19.2.0' \
  -H 'accept-language: en-us' \
  --compressed 'https://sapphire-api.target.com/sapphire/runtime/api/v1/qualified-experiments?source=flagship_ios&app_version=2020.12&visitor_id=0170d979860f0104D23AAE69B5F44CC0&channel=apps&redcard_holder=false&device=x86_64&tm=true&latitude=33.605000&member_id=5232392412&os_version=13.3&app_name=Target&longitude=-86.637000&in_store=false&os_family=iOS' \
  | jq \
  | grep featureVersions_
end

