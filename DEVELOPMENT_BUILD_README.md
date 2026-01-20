# Сборка Development версии Nextcloud Talk для тестирования

## Обзор

Этот документ описывает, как собрать development версию приложения Nextcloud Talk для тестирования на реальном устройстве iOS, без публикации в App Store.

## Требования

1. **Apple Developer Account** - активный аккаунт разработчика Apple
2. **Development Certificate** - сертификат разработчика iOS
3. **Development Provisioning Profile** - профиль для разработки
4. **Регистрированные устройства** - ваше устройство должно быть зарегистрировано в Apple Developer Console

## Настройка Codemagic

### 1. Создайте проект в Codemagic

1. Перейдите на [codemagic.io](https://codemagic.io)
2. Создайте новый проект из репозитория GitHub
3. Выберите этот репозиторий

### 2. Настройте Environment Variables

В настройках проекта Codemagic добавьте следующие переменные:

```
APP_STORE_USERNAME=ваш_apple_id@email.com
APP_STORE_PASSWORD=ваш_app_specific_password
CM_CERTIFICATE=ваш_development_certificate.p12
CM_CERTIFICATE_PASSWORD=пароль_от_сертификата
CM_PROVISIONING_PROFILE=ваш_development_provisioning_profile.mobileprovision
DEVELOPMENT_TEAM=ваш_team_id
```

### 3. Получите необходимые файлы

#### Development Certificate:
1. Откройте Keychain Access на Mac
2. Экспортируйте ваш iOS Development certificate в формате .p12
3. Используйте этот файл как `CM_CERTIFICATE`

#### Provisioning Profile:
1. Войдите в [Apple Developer Console](https://developer.apple.com/account)
2. Перейдите в Certificates, Identifiers & Profiles
3. Создайте или скачайте Development Provisioning Profile
4. Используйте этот файл как `CM_PROVISIONING_PROFILE`

#### Team ID:
- Найдите ваш Team ID в Apple Developer Console в разделе Membership

### 4. Замените YOUR_TEAM_ID

В файлах `exportOptionsDevelopment.plist` замените `YOUR_TEAM_ID` на ваш реальный Team ID.

## Запуск сборки

### Через Codemagic Dashboard

1. Перейдите в ваш проект в Codemagic
2. Нажмите "Start new build"
3. Выберите workflow: `ios-development`
4. Нажмите "Start build"

### Через Git Push

Сборка автоматически запустится при пуше в main ветку или при создании PR.

## Скачивание и установка

После успешной сборки:

1. Перейдите в раздел "Artifacts" в Codemagic
2. Скачайте файл `NextcloudTalk.ipa`
3. Установите на ваше устройство одним из способов:

### Способ 1: Через Xcode (рекомендуется)

1. Подключите ваше устройство к Mac с Xcode
2. Откройте Xcode
3. Перейдите в Window → Devices and Simulators
4. Выберите ваше устройство
5. Перетащите скачанный .ipa файл в раздел "Installed Apps"

### Способ 2: Через iTunes/Finder

1. Подключите устройство к Mac
2. Откройте Finder (macOS Catalina+) или iTunes (старые версии)
3. Выберите ваше устройство
4. Перейдите в раздел "Apps"
5. Перетащите .ipa файл в список приложений

### Способ 3: Через TestFlight (если включено)

Если у вас настроен TestFlight, сборка автоматически загрузится в TestFlight.

## Устранение проблем

### Ошибка кодовой подписи

- Убедитесь, что ваш Development Certificate действителен
- Проверьте, что Provisioning Profile включает ваше устройство
- Убедитесь, что Bundle ID соответствует профилю

### Ошибка "Device not registered"

- Зарегистрируйте ваше устройство в Apple Developer Console
- Пересоздайте Provisioning Profile с включенным устройством
- Обновите переменные в Codemagic

### Проблемы с зависимостями

```bash
# Очистите кэш CocoaPods
pod cache clean --all
pod install
```

## Локальная сборка (на Mac с Xcode)

Если у вас есть Mac с Xcode, вы можете собрать приложение локально:

```bash
# Установите зависимости
pod install

# Откройте проект
open NextcloudTalk.xcworkspace

# В Xcode:
# 1. Выберите схему NextcloudTalk
# 2. Выберите ваше устройство как target
# 3. Нажмите Cmd+R для запуска или Cmd+B для сборки
```

## Следующие шаги

После успешной установки на устройство:

1. Запустите приложение
2. Проверьте основные функции
3. Протестируйте на разных устройствах
4. Соберите обратную связь для дальнейшей разработки

## Контакты

При возникновении проблем обратитесь к документации Nextcloud Talk или создайте issue в репозитории.