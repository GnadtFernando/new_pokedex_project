# 🐦 Projeto Flutter

Este é um projeto Flutter criado com a versão **3.32.0** do SDK.

## 📋 Requisitos

Antes de começar, certifique-se de que você tem as seguintes ferramentas instaladas:

- [Flutter 3.32.0](https://docs.flutter.dev/get-started/install)
- [Dart (incluído com Flutter)]
- [Android Studio, VS Code ou outro editor compatível]
- [Emulador Android ou dispositivo físico]

> 💡 Para verificar se o Flutter está corretamente instalado, execute:
```bash
flutter doctor
```

---

## 🚀 Como executar

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/nome-do-projeto.git
cd nome-do-projeto
```

### 2. Certifique-se de que está usando a versão correta do Flutter

Se estiver usando o Flutter com versões gerenciadas (ex: via FVM), você pode ativar a versão do projeto com:

```bash
fvm use 3.32.0
fvm flutter pub get
```

Ou, caso esteja usando Flutter diretamente:

```bash
flutter --version
# Se não for 3.32.0, mude manualmente ou instale:
flutter downgrade 3.32.0
flutter pub get
```

### 3. Instale as dependências

```bash
flutter pub get
```

### 4. Execute o app

#### Em modo debug:

```bash
flutter run
```

#### Em modo release:

```bash
flutter run --release
```

---

## 🛠 Estrutura do Projeto

```
lib/
├── main.dart
├── ...
```

---

## 📦 Build (APK ou iOS)

### Android (APK)

```bash
flutter build apk --release
```

O APK será gerado em: `build/app/outputs/flutter-apk/app-release.apk`

### iOS

> ⚠️ Apenas em macOS com Xcode instalado.

```bash
flutter build ios --release
```

---

## ❓ Problemas comuns

- Execute `flutter doctor` para checar o ambiente.
- Verifique se há um emulador ativo ou dispositivo conectado.
- Use `flutter clean` e `flutter pub get` caso tenha erros inesperados.

---
