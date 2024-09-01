```
git clone https://github.com/user/project.git
cd project
npm install
open project.xcodeproj
xcrun xcodebuild -project project.xcodeproj -target project -configuration Debug
xcrun simctl launch booted project
```