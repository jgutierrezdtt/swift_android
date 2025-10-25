# Swift Hello World - iOS & Android

A minimal "Hello World" application demonstrating Swift development for both iOS and Android platforms using the new Swift SDK for Android (announced October 2025 by Swift.org).

## Project Structure

```
swift_android/
├── iOS/                          # iOS application
│   ├── HelloWorld.xcodeproj/     # Xcode project
│   └── HelloWorld/               # iOS source files
│       ├── HelloWorldApp.swift   # App entry point
│       └── ContentView.swift     # SwiftUI view
├── Android/                      # Android application
│   ├── Package.swift             # Swift Package Manager config
│   └── app/
│       └── src/
│           └── main.swift        # Android app entry point
└── .github/
    └── workflows/
        ├── ios-build.yml         # iOS CI/CD pipeline
        └── android-build.yml     # Android CI/CD pipeline
```

## Prerequisites

### For iOS Development

1. **macOS** (required for iOS development)
2. **Xcode 15.0 or later**
   - Download from the [Mac App Store](https://apps.apple.com/us/app/xcode/id497799835)
   - Or download from [Apple Developer](https://developer.apple.com/download/)
3. **Command Line Tools**
   ```bash
   xcode-select --install
   ```

### For Android Development

1. **Swift Toolchain (6.0 or later)**
   - Download from [Swift.org](https://swift.org/download/)
   - On macOS:
     ```bash
     # Download and install Swift toolchain
     # Follow instructions at swift.org/download
     ```
   - On Linux:
     ```bash
     # Ubuntu/Debian
     sudo apt-get install \
       binutils \
       git \
       gnupg2 \
       libc6-dev \
       libcurl4-openssl-dev \
       libedit2 \
       libgcc-9-dev \
       libpython3.8 \
       libsqlite3-0 \
       libstdc++-9-dev \
       libxml2-dev \
       libz3-dev \
       pkg-config \
       tzdata \
       unzip \
       zlib1g-dev
     
     # Install Swift
     wget https://download.swift.org/swift-6.0-release/ubuntu2004/swift-6.0-RELEASE/swift-6.0-RELEASE-ubuntu20.04.tar.gz
     tar xzf swift-6.0-RELEASE-ubuntu20.04.tar.gz
     sudo mv swift-6.0-RELEASE-ubuntu20.04 /usr/share/swift
     echo 'export PATH=/usr/share/swift/usr/bin:$PATH' >> ~/.bashrc
     source ~/.bashrc
     ```

2. **Swift SDK for Android**
   - Visit [Swift.org Android SDK](https://swift.org/download/) for the latest release
   - Download the Swift SDK for Android toolchain
   - Install according to the official documentation:
     ```bash
     # Download Swift SDK for Android
     # Extract to a known location
     # Set environment variables as documented
     ```

3. **Android NDK (r26 or later)**
   - Download from [Android NDK](https://developer.android.com/ndk/downloads)
   ```bash
   # Set NDK path
   export ANDROID_NDK_HOME=/path/to/android-ndk-r26
   ```

4. **Android SDK**
   - Install via [Android Studio](https://developer.android.com/studio) or command-line tools
   ```bash
   export ANDROID_SDK_ROOT=/path/to/android-sdk
   ```

## Building and Running

### iOS

#### Using Xcode (GUI)

1. Open the project:
   ```bash
   open iOS/HelloWorld.xcodeproj
   ```

2. Select a simulator or device from the scheme selector

3. Press **⌘R** or click the Play button to build and run

#### Using xcodebuild (Command Line)

```bash
cd iOS

# Build for simulator
xcodebuild -project HelloWorld.xcodeproj \
  -scheme HelloWorld \
  -sdk iphonesimulator \
  -destination 'platform=iOS Simulator,name=iPhone 15' \
  build

# Build for device (requires signing configuration)
xcodebuild -project HelloWorld.xcodeproj \
  -scheme HelloWorld \
  -sdk iphoneos \
  -configuration Release \
  build
```

### Android

#### Using Swift SDK for Android (Cross-compile)

```bash
cd Android

# Build with Swift Package Manager
swift build -c release

# The executable will be in .build/release/HelloWorld
.build/release/HelloWorld
```

#### Cross-compiling for Android from Linux/macOS

With the Swift SDK for Android installed:

```bash
cd Android

# Set up cross-compilation for Android
# (Exact commands depend on Swift SDK for Android installation)
swift build \
  --swift-sdk aarch64-unknown-linux-android \
  -c release

# Deploy to Android device via adb
adb push .build/release/HelloWorld /data/local/tmp/
adb shell chmod +x /data/local/tmp/HelloWorld
adb shell /data/local/tmp/HelloWorld
```

## GitHub Actions CI/CD

This repository includes two automated build workflows:

### iOS Build Workflow (`.github/workflows/ios-build.yml`)

- **Runs on**: macOS runner
- **Triggers**: Push to main, pull requests, manual dispatch
- **Steps**:
  1. Checks out code
  2. Selects Xcode version
  3. Builds the iOS app using `xcodebuild`
  4. Reports build status

### Android Build Workflow (`.github/workflows/android-build.yml`)

- **Runs on**: Linux (Ubuntu) runner
- **Triggers**: Push to main, pull requests, manual dispatch
- **Steps**:
  1. Checks out code
  2. Sets up Swift toolchain
  3. Installs Swift SDK for Android
  4. Cross-compiles the Android app
  5. Reports build status

## Development Notes

### iOS App Features

- Uses **SwiftUI** for the user interface
- Displays "Hello, World!" message
- Minimum deployment target: iOS 17.0
- Universal app (iPhone and iPad)

### Android App Features

- Pure Swift console application
- Prints "Hello, World!" to stdout
- Uses Foundation framework
- Cross-compiled using Swift SDK for Android

## Troubleshooting

### iOS

**Issue**: Build fails with code signing error
```
Solution: For simulator builds, use CODE_SIGNING_REQUIRED=NO
For device builds, configure your Apple Developer account in Xcode
```

**Issue**: Simulator not found
```
Solution: Run `xcrun simctl list` to see available simulators
Update the destination in the build command
```

### Android

**Issue**: Swift SDK for Android not found
```
Solution: Verify installation and environment variables:
echo $ANDROID_NDK_HOME
echo $ANDROID_SDK_ROOT
Reinstall Swift SDK for Android from swift.org
```

**Issue**: Cross-compilation fails
```
Solution: Ensure all Android NDK and SDK paths are correctly configured
Check Swift SDK for Android documentation for your platform
```

## Resources

- [Swift.org](https://swift.org/) - Official Swift website
- [Swift SDK for Android Documentation](https://swift.org/documentation/android/)
- [Swift Package Manager](https://swift.org/package-manager/)
- [Xcode Documentation](https://developer.apple.com/documentation/xcode)
- [Android NDK Documentation](https://developer.android.com/ndk/guides)

## License

This is a demonstration project. Feel free to use it as a starting point for your own Swift cross-platform applications.

## Contributing

This is a minimal example project. For questions or improvements, please open an issue or pull request.

---

**Note**: The Swift SDK for Android was announced in October 2025. This project uses the official toolchain and follows best practices as documented by Swift.org. As the SDK evolves, some steps may need to be updated.