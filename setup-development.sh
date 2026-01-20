#!/bin/bash

# Скрипт настройки development сборки для Nextcloud Talk iOS
# Используется для подготовки проекта к development сборке

set -e

echo "🚀 Настройка development сборки Nextcloud Talk iOS"

# Проверка наличия необходимых инструментов
echo "📋 Проверка необходимых инструментов..."

if ! command -v pod &> /dev/null; then
    echo "❌ CocoaPods не установлен. Установите командой: sudo gem install cocoapods"
    exit 1
fi

if ! command -v swiftlint &> /dev/null; then
    echo "⚠️  SwiftLint не установлен. Рекомендуется установить для проверки качества кода."
    echo "Установка: brew install swiftlint"
fi

# Установка зависимостей
echo "📦 Установка CocoaPods зависимостей..."
pod install

# Проверка наличия необходимых файлов
echo "🔍 Проверка конфигурационных файлов..."

if [ ! -f "exportOptionsDevelopment.plist" ]; then
    echo "❌ Файл exportOptionsDevelopment.plist не найден!"
    exit 1
fi

if [ ! -f "codemagic.yaml" ]; then
    echo "❌ Файл codemagic.yaml не найден!"
    exit 1
fi

# Проверка на наличие YOUR_TEAM_ID в конфигурационных файлах
if grep -q "YOUR_TEAM_ID" exportOptionsDevelopment.plist; then
    echo "⚠️  В exportOptionsDevelopment.plist найден YOUR_TEAM_ID."
    echo "Замените YOUR_TEAM_ID на ваш реальный Apple Developer Team ID"
fi

if grep -q "YOUR_TEAM_ID" codemagic.yaml; then
    echo "⚠️  В codemagic.yaml найден YOUR_TEAM_ID."
    echo "Замените YOUR_TEAM_ID на ваш реальный Apple Developer Team ID"
fi

# Проверка инициализации субмодулей
echo "🔗 Проверка субмодулей..."
if [ ! -d "ThirdParty/WebRTC" ]; then
    echo "📥 Инициализация субмодулей..."
    git submodule update --init --recursive
fi

echo ""
echo "✅ Подготовка завершена!"
echo ""
echo "📝 Следующие шаги:"
echo "1. Зарегистрируйтесь на codemagic.io"
echo "2. Создайте проект из этого репозитория"
echo "3. Добавьте следующие переменные окружения:"
echo "   - APP_STORE_USERNAME"
echo "   - APP_STORE_PASSWORD (app-specific password)"
echo "   - CM_CERTIFICATE (development certificate .p12)"
echo "   - CM_CERTIFICATE_PASSWORD"
echo "   - CM_PROVISIONING_PROFILE"
echo "   - DEVELOPMENT_TEAM"
echo ""
echo "4. Замените YOUR_TEAM_ID в exportOptionsDevelopment.plist на ваш Team ID"
echo "5. Запустите сборку с workflow 'ios-development'"
echo ""
echo "📖 Подробные инструкции в DEVELOPMENT_BUILD_README.md"