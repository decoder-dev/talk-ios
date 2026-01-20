# 📦 Сборка IPA файла Nextcloud Talk

## Способы сборки

### 🚀 Способ 1: GitHub Actions (Рекомендуется)

1. **Настройте секреты в GitHub:**
   - Перейдите в Settings → Secrets and variables → Actions
   - Добавьте секрет: `DEVELOPMENT_TEAM` = ваш Apple Team ID

2. **Запустите workflow:**
   - Перейдите в Actions → Build IPA → Run workflow
   - Или просто запушьте код в main/develop ветку

3. **Скачайте IPA:**
   - После сборки перейдите в Actions → Последний запуск → Artifacts
   - Скачайте `NextcloudTalk-IPA`

### 🔧 Способ 2: Codemagic

1. **Создайте проект** на codemagic.io из этого репозитория
2. **Добавьте переменные:**
   ```
   DEVELOPMENT_TEAM=ваш_team_id
   ```
3. **Запустите workflow** `ios-development`
4. **Скачайте IPA** из раздела Artifacts

### 💻 Способ 3: Локально на Mac

1. **Установите зависимости:**
   ```bash
   brew install swiftlint
   gem install cocoapods
   pod install
   ```

2. **Настройте переменные:**
   ```bash
   export DEVELOPMENT_TEAM=ваш_team_id
   ```

3. **Запустите сборку:**
   ```bash
   chmod +x build-ipa.sh
   ./build-ipa.sh
   ```

4. **Результат:** `build/NextcloudTalk.ipa`

### 🐳 Способ 4: Docker (Экспериментально)

```bash
# Сборка образа
docker build -f Dockerfile.build -t talk-builder .

# Запуск сборки
docker run --rm \
  -e DEVELOPMENT_TEAM=ваш_team_id \
  -v $(pwd)/build:/app/build \
  talk-builder
```

## 📱 Установка на устройство

### Через Xcode:
1. Подключите iOS устройство к Mac
2. Откройте Xcode → Window → Devices and Simulators
3. Перетащите `.ipa` файл в список приложений

### Через Finder/iTunes:
1. Подключите устройство
2. Перетащите `.ipa` файл в раздел Apps

## ⚙️ Настройка

### Получение Team ID:
1. Войдите в [Apple Developer Console](https://developer.apple.com/account)
2. Перейдите в Membership
3. Скопируйте Team ID

### Требования:
- ✅ Apple Developer Account
- ✅ Зарегистрированное устройство
- ✅ Development Certificate
- ✅ Provisioning Profile

## 🐛 Устранение проблем

### Ошибка кодовой подписи:
```bash
# Проверьте Team ID
echo $DEVELOPMENT_TEAM

# Проверьте сертификаты
security find-identity -v -p codesigning
```

### Ошибка зависимостей:
```bash
# Очистка кэша
pod cache clean --all
rm -rf Pods/
pod install
```

## 📋 Файлы

- `build-ipa.sh` - Скрипт сборки
- `exportOptionsDevelopment.plist` - Настройки экспорта
- `.github/workflows/build-ipa.yml` - GitHub Actions
- `Dockerfile.build` - Docker конфигурация

## 🎯 Быстрый старт

```bash
# 1. Клонируйте репозиторий
git clone https://github.com/decoder-dev/talk-ios.git
cd talk-ios

# 2. Настройте Team ID в exportOptionsDevelopment.plist
# Замените YOUR_TEAM_ID на ваш реальный Team ID

# 3. Запустите сборку через GitHub Actions
# Или используйте Codemagic, или соберите локально на Mac
```

**Результат:** Готовый `NextcloudTalk.ipa` файл для установки на устройство! 📱