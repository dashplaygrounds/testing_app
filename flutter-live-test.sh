#!/bin/bash
# flutter clean
flutter pub get
flutter pub upgrade --major-versions
flutter run -d chrome --web-port 3000