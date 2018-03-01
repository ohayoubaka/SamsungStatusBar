#!/usr/bin/env sh

        find ~ -type f -name "*.apk"

cp app/build/outputs/apk/release/app-release-unsigned.apk SamsungStatusBar-$TRAVIS_BUILD_NUMBER.apk
curl -F chat_id="-1001295252259" -F text="$(./scripts/changelog.sh)" -F parse_mode="HTML" https://api.telegram.org/bot$BOT_TOKEN/sendMessage
curl -F chat_id="-1001295252259" -F document=@"SamsungStatusBar-$TRAVIS_BUILD_NUMBER.apk" https://api.telegram.org/bot$BOT_TOKEN/sendDocument

echo $(./scripts/changelog.sh)
