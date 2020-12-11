#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title TestFlight Distribute
# @raycast.mode fullOutput
#
# Optional parameters:
# @raycast.icon tf.png
# @raycast.currentDirectoryPath ~/dev/ios
# @raycast.packageName Flagship
# @raycast.needsConfirmation true
# @raycast.argument1 { "type": "text", "placeholder": "version" }
# @raycast.argument2 { "type": "text", "placeholder": "build" }
# @raycast.argument3 { "type": "text", "placeholder": "changelog" }

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
  --app_version ${1} \
  --build_number ${2} \
  --notify_external_testers true \
  --distribute_external true \
  --groups "Beta Testers" \
  --changelog ${3} \
  #--wait_for_uploaded_build true
  #--reject_build_waiting_for_review true \
  #--beta_app_review_info "Beta app review info" \
  #--localized_app_info "Localized app info" \
  