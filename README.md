**README.md**

## Project X

### Setup

1. Clone the repository:
```
git clone https://github.com/user/project.git
```

2. Navigate to the project
```
cd project
```

3. Install dependencies:
```
npm install
```

4. Open the Xcode project:
```
open project.xcodeproj
```

### Build and Run

5. Build the project in Debug configuration:
```
xcrun xcodebuild -project project.xcodeproj -target project -configuration Debug
```

6. Run the project on a simulator:
```
xcrun simctl launch booted project
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