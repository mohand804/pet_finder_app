# 🐱 Pet Finder App

A modern Flutter application for discovering and exploring different cat breeds using The Cat API. Built with clean architecture principles and state management using BLoC pattern.

## ✨ Features

- **Browse Cat Breeds**: Explore a comprehensive list of cat breeds with detailed information
- **Search Functionality**: Search for specific cat breeds
- **Favorites Management**: Save and manage your favorite cat breeds
- **Onboarding**: Welcome screen for first-time users
- **Responsive UI**: Beautiful and adaptive interface using Flutter ScreenUtil
- **Offline Storage**: Local data persistence using SharedPreferences

## 🛠️ Tech Stack

- **Flutter SDK**: ^3.9.2
- **State Management**: BLoC (flutter_bloc)
- **Dependency Injection**: GetIt
- **Networking**: Dio with Retrofit
- **Code Generation**: Freezed, JSON Serializable
- **UI**: Flutter ScreenUtil, Flutter SVG
- **Testing**: BLoC Test, Mocktail
- **Architecture**: Clean Architecture with Repository Pattern

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (3.9.2 or higher)
  - [Download Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git**

### Platform-Specific Requirements

#### For Android Development:

- Android Studio
- Android SDK (API level 21 or higher)
- Java Development Kit (JDK) 11 or higher

#### For iOS Development (macOS only):

- Xcode (latest version)
- CocoaPods
- iOS Simulator or physical iOS device

#### For Windows Development:

- Visual Studio 2022 with Desktop development with C++ workload

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd pet_finder_app
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Required Files

This project uses code generation for models and API services. Run:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

> **Note**: If you make changes to models or API services in the future, run this command again.

### 4. Verify Flutter Installation

```bash
flutter doctor
```

Fix any issues reported by Flutter Doctor before proceeding.

## ▶️ Running the App

### Run on All Platforms

```bash
flutter run
```

### Run on Specific Platform

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Windows
flutter run -d windows

# Web
flutter run -d chrome
```

### Build Release Version

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release

# Windows
flutter build windows --release
```

## 🗂️ Project Structure

```
lib/
├── core/
│   ├── di/                    # Dependency Injection setup
│   ├── helpers/               # Helper utilities
│   ├── networking/            # API services, Dio setup
│   ├── routing/               # App navigation/routing
│   ├── theming/               # App theme and colors
│   └── widgets/               # Reusable widgets
├── features/
│   ├── favorite/              # Favorites feature
│   │   ├── data/             # Data layer (repositories)
│   │   ├── logic/            # Business logic (BLoC/Cubit)
│   │   └── ui/               # UI layer (screens/widgets)
│   ├── home/                  # Home/Browse feature
│   │   ├── data/
│   │   ├── logic/
│   │   └── ui/
│   └── onboarding/            # Onboarding feature
├── main.dart                  # App entry point
└── pet_finder_app.dart        # Root app widget

test/                          # Unit and widget tests
assets/                        # Images, fonts, and SVGs
```

## 🧪 Testing

### Run All Tests

```bash
flutter test
```

### Run Tests with Coverage

```bash
flutter test --coverage
```

### Run Specific Test File

```bash
flutter test test/cat_breed_cubit_test.dart
```

### Available Tests

- `cat_breed_cubit_test.dart` - Unit tests for CatBreedCubit
- `cat_breed_repo_test.dart` - Unit tests for CatBreedRepository
- `favorite_cubit_test.dart` - Unit tests for FavoriteCubit
- `favorite_repo_test.dart` - Unit tests for FavoriteRepository

## 🔑 API Configuration

This app uses [The Cat API](https://thecatapi.com/) for fetching cat breed data.

### Current Setup

The app includes a demo API key for testing purposes. This key is located in:

```
lib/core/networking/api_constants.dart
```

### Using Your Own API Key (Optional)

1. Visit [The Cat API](https://thecatapi.com/) and sign up for a free account
2. Get your API key from the dashboard
3. Replace the `demoApiKey` in `lib/core/networking/api_constants.dart`:

```dart
class ApiConstants {
  static const String baseUrl = 'https://api.thecatapi.com/v1/';
  static const String demoApiKey = 'YOUR_API_KEY_HERE';
  // ...
}
```

## 🔧 Troubleshooting

### Common Issues

#### 1. Build Runner Errors

```bash
# Clean and rebuild generated files
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

#### 2. Gradle Build Failures (Android)

```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

#### 3. iOS Build Issues (macOS)

```bash
cd ios
rm -rf Pods Podfile.lock
pod install --repo-update
cd ..
flutter clean
flutter pub get
```

#### 4. "Waiting for another flutter command to release the startup lock"

```bash
# Delete the lock file
rm <flutter-sdk-path>/bin/cache/lockfile
```

#### 5. Dependencies Not Resolving

```bash
flutter pub cache repair
flutter pub get
```

## 📱 Supported Platforms

- ✅ Android (API 21+)
- ✅ iOS (12.0+)
- ✅ Windows (10+)
- ✅ Linux
- ✅ macOS
- ✅ Web

## 🎨 Custom Fonts

This project uses the **Poppins** font family with all weights (Thin to Black). The fonts are located in `assets/fonts/` and configured in `pubspec.yaml`.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 Code Generation Commands

### When to Run Code Generation

Run these commands whenever you:

- Add/modify Freezed models
- Add/modify JSON serializable classes
- Add/modify Retrofit API endpoints

```bash
# One-time build
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerates on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- [The Cat API](https://thecatapi.com/) for providing the cat breed data
- Flutter team for the amazing framework
- All open-source contributors whose packages made this project possible

## 📞 Support

If you encounter any issues or have questions:

1. Check the Troubleshooting section above
2. Search existing issues in the repository
3. Create a new issue with detailed information about your problem

---

**Built with ❤️ using Flutter**
