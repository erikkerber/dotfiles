#!/usr/bin/env ruby

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Revite
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon tf.png
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship

puts RUBY_VERSION
exit
require 'Spaceship'

ENV["FASTLANE_TEAM_NAME"] = "Target"
Spaceship::Tunes.login('erik.kerber@target.com', 'Voltage!1')
Spaceship::Tunes.select_team


Spaceship::TestFlight::Tester.all(app_id: "297430070")

# Find a profile with a specific name
#profile = Spaceship::Portal.provisioning_profile.development.all.first { |p| p.name == "{query}" }

#profile.devices = Spaceship::Portal.device.all
#profile.update!

#puts "{query} Regenerated!"

#Spaceship::Portal.login('apple.developer.ci@target.com', 'UDeRkN,DdeAocdiKKpfhHytJAdTB6U')
#app = Spaceship::ConnectAPI::App.find("com.target.Target")
#app.get_beta_testers(filter: { email: "gregory.lindholm@target.com" }, includes: "apps,betaTesterMetrics,betaGroups").first
