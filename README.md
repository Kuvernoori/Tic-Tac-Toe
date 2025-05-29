# 🎮 Tic-Tac-Toe Flutter Game

Welcome to our cross-platform **Tic-Tac-Toe (Крестики-Нолики)** game developed by **Group SE2329** from **Astana IT University**!  
Built with ❤️ using **Flutter**, this project offers both offline and online gameplay, beautiful themes, multilingual support, and more.

---

## ✨ Features

- 🧠 **Tic-Tac-Toe** game with smart UI
- 🔌 **Offline Mode** (local 2-player)
- ☁️ **Online Mode** using Firebase (real-time multiplayer)
- 🌐 **Multilingual UI**: Kazakh 🇰🇿, Russian 🇷🇺, English 🇬🇧
- 🌓 **Light/Dark Theme** toggle
- 📊 **Match History** with wins/losses
- 🔒 **Firebase Authentication** (anonymous)
- 📱 Cross-platform (Android & iOS)
- ℹ️ **About Page** with full team info

---

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (3.0 or higher)
- Firebase project (for online mode)

### 🔧 Installation

```bash
git clone https://github.com/your-username/tic-tac-toe-flutter.git
cd tic-tac-toe-flutter
flutter pub get
```

🛠️ Firebase Setup
Go to Firebase Console

Create a new project.

Enable:

Authentication (Anonymous)

Firestore Database

Download google-services.json (for Android) and GoogleService-Info.plist (for iOS) and place them in appropriate folders.

Enable Firebase in your pubspec.yaml dependencies.

## 🌍 Language Support

🇰🇿 Kazakh

🇷🇺 Russian

🇬🇧 English

Language is switchable from the Settings screen. All content is localized using Flutter’s intl package.

🎨 Theme Support
☀️ Light Mode

🌙 Dark Mode

### Theme changes are persistent and saved locally using SharedPreferences.

## 🧩 Game Logic

Classic 3x3 grid

Turn-based player flow

Win/draw detection

Real-time sync in online mode

History saved locally (offline and online)

## 🏛️ About Us

Project: Tic-Tac-Toe Game
Group: SE2329
University: Astana IT University
Year: 2025

Contributors:

👤 [Berkamalov Sanzhar]

👤 [Sabyraly Gaukharbek]

👤 [Seytkadir Alisher]

👤 [Rakhmangali Madiyar]



