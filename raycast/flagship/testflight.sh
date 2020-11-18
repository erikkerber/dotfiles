#!/bin/bash

# Raycast Script Command Template
#
# Duplicate this file and remove ".template." from the filename to get started.
# See full documentation here: https://github.com/raycast/script-commands
#
# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title TestFlight Distribute
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon 🎯
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship

export FASTLANE_DISABLE_COLORS=1
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


fastlane pilot distribute \
  --app_identifier "com.target.Target" \
  --username "apple.developer.ci@target.com" \
  --team_name "Target" \
  --team_id "126136" \
  --demo_account_required true \
  --build_number "1" \
  --app_version "2020.20.6" \
  --notify_external_testers false \
  --distribute_external true \
  --reject_build_waiting_for_review true \
  --groups "Beta Testers" \
  --changelog "What's new in 2020.20.6"
  
  #--beta_app_review_info "Beta app review info" \
	#--localized_app_info "Localized app info" \
  