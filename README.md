## Project X

### Setup

```
git clone https://github.com/user/project.git
cd project
flutter pub get
open project.xcodeproj
```

### Build and Run

**iOS**
```
# Build project in Debug configuration
flutter build ios --debug
# Run project on a simulator
xcrun simctl launch booted project
```

**Android**
```
# Build project in Debug configuration
flutter build apk --debug
# Run project on an emulator
adb install app/build/outputs/apk/debug/app-debug.apk
```

### Flavors

#### Dev Flavor

- **Build:**
```
flutter build apk --flavor dev
```

- **Run:**
```
adb install app/build/outputs/apk/dev/app-dev-debug.apk
```

#### Prod Flavor

- **Build:**
```
flutter build apk --flavor prod
```

- **Run:**
```
adb install app/build/outputs/apk/prod/app-prod-release.apk
```