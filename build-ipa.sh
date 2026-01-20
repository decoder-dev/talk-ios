#!/bin/bash

# Простой скрипт для сборки IPA файла Nextcloud Talk
# Используется в CI/CD системах (Codemagic, GitHub Actions и т.д.)

set -e

echo "🚀 Сборка IPA файла Nextcloud Talk"

# Переменные (замените на свои значения)
export XCODE_WORKSPACE="NextcloudTalk.xcworkspace"
export XCODE_SCHEME="NextcloudTalk"
export DEVELOPMENT_TEAM="${DEVELOPMENT_TEAM:-YOUR_TEAM_ID}"
export CODE_SIGN_IDENTITY="iPhone Developer"

echo "📋 Проверка переменных..."
if [ "$DEVELOPMENT_TEAM" = "YOUR_TEAM_ID" ]; then
    echo "❌ Установите DEVELOPMENT_TEAM в переменные окружения"
    exit 1
fi

# Установка зависимостей
echo "📦 Установка CocoaPods зависимостей..."
pod install

# Очистка
echo "🧹 Очистка предыдущих сборок..."
xcodebuild clean -workspace "$XCODE_WORKSPACE" -scheme "$XCODE_SCHEME"

# Сборка архива
echo "🔨 Сборка архива..."
xcodebuild archive \
    -workspace "$XCODE_WORKSPACE" \
    -scheme "$XCODE_SCHEME" \
    -configuration Debug \
    -sdk iphoneos \
    -archivePath "build/NextcloudTalk.xcarchive" \
    DEVELOPMENT_TEAM="$DEVELOPMENT_TEAM" \
    CODE_SIGN_IDENTITY="$CODE_SIGN_IDENTITY"

# Экспорт IPA
echo "📦 Экспорт IPA..."
xcodebuild -exportArchive \
    -archivePath "build/NextcloudTalk.xcarchive" \
    -exportOptionsPlist "exportOptionsDevelopment.plist" \
    -exportPath "build"

echo "✅ IPA файл готов: build/NextcloudTalk.ipa"
echo "📁 Содержимое папки build:"
ls -la build/

echo ""
echo "📱 Для установки на устройство:"
echo "1. Скачайте NextcloudTalk.ipa"
echo "2. Подключите iOS устройство к Mac с Xcode"
echo "3. Перетащите IPA в Xcode -> Window -> Devices and Simulators"