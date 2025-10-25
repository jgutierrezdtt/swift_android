# Swift Cross-Platform Hello World (iOS & Android)

A demonstration of building a single Swift codebase that runs natively on both iOS and Android using the new Swift SDK for Android (October 2025).

## Overview

This project demonstrates how to:
- Write shared Swift code that compiles for both iOS and Android
- Build native applications for both platforms from a single codebase
- Set up CI/CD pipelines for automated builds

## Project Structure

```
swift_android/
├── Sources/HelloWorld/          # Shared Swift command-line demo
├── iOS/                         # iOS-specific app
│   └── HelloWorldiOS/          # SwiftUI iOS app
├── Android/                     # Android-specific app
│   └── app/src/main/swift/     # Swift code for Android
├── .github/workflows/           # CI/CD pipelines
│   ├── ios.yml                 # iOS build workflow
│   └── android.yml             # Android build workflow
└── README.md                   # This file
```

## Prerequisites

### For iOS Development (macOS only)

1. **Xcode 15.0+**
   - Download from the Mac App Store or [Apple Developer](https://developer.apple.com/xcode/)
   - Includes Swift toolchain

2. **Command Line Tools**
   ```bash
   xcode-select --install
   ```

### For Android Development

1. **Swift 6.2+ with Android SDK Support**
   - Download from [Swift.org](https://www.swift.org/download/)
   - For Linux: Install the Swift toolchain
   ```bash
   # Example for Ubuntu/Debian
   wget https://download.swift.org/swift-6.2-release/ubuntu2204/swift-6.2-RELEASE/swift-6.2-RELEASE-ubuntu22.04.tar.gz
   tar xzf swift-6.2-RELEASE-ubuntu22.04.tar.gz
   export PATH=/path/to/swift-6.2-RELEASE-ubuntu22.04/usr/bin:$PATH
   ```

2. **Android SDK & NDK**
   - Download Android Command Line Tools from [Android Studio](https://developer.android.com/studio)
   - Install SDK and NDK:
   ```bash
   # Using sdkmanager
   sdkmanager "platforms;android-34"
   sdkmanager "build-tools;34.0.0"
   sdkmanager "ndk;27.3.13750724"
   ```

3. **Environment Variables**
   ```bash
   export ANDROID_HOME=/path/to/android-sdk
   export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.3.13750724
   export PATH=$ANDROID_HOME/platform-tools:$PATH
   ```

## Building and Running

### Shared Swift Package (Command Line)

The root package contains a simple command-line "Hello World" that works on any platform with Swift:

```bash
# Build
swift build

# Run
./.build/debug/HelloWorld
```

### iOS Application

#### Option 1: Using Xcode (Recommended)

1. Open the iOS directory in Xcode:
   ```bash
   cd iOS
   open Package.swift
   ```

2. Select your target device or simulator

3. Press `Cmd+R` to build and run

#### Option 2: Command Line

```bash
cd iOS
swift build
```

To create an app bundle for iOS devices, you'll need to use Xcode or xcodebuild:

```bash
xcodebuild -scheme HelloWorldiOS \
  -destination 'platform=iOS Simulator,name=iPhone 15' \
  -configuration Debug \
  build
```

### Android Application

Build for Android using Swift's cross-compilation capabilities:

```bash
cd Android

# Build for Android ARM64
swift build \
  --triple aarch64-unknown-linux-android24 \
  --sdk $ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/sysroot \
  -Xcc -I$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include \
  -Xcc -I$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/aarch64-linux-android
```

The compiled binary will be in `.build/aarch64-unknown-linux-android24/debug/HelloWorldAndroid`

#### Running on Android Device/Emulator

1. Start an Android emulator or connect a device:
   ```bash
   adb devices
   ```

2. Push the binary to the device:
   ```bash
   adb push .build/aarch64-unknown-linux-android24/debug/HelloWorldAndroid /data/local/tmp/
   adb shell chmod +x /data/local/tmp/HelloWorldAndroid
   ```

3. Run the application:
   ```bash
   adb shell /data/local/tmp/HelloWorldAndroid
   ```

## Continuous Integration

This project includes GitHub Actions workflows for automated building and testing:

### iOS Build (`ios.yml`)
- Runs on macOS runners
- Uses Xcode and xcodebuild
- Builds for iOS Simulator
- Triggered on push/PR to main branch

### Android Build (`android.yml`)
- Runs on Linux runners
- Uses Swift SDK for Android cross-compilation
- Builds ARM64 binary for Android
- Triggered on push/PR to main branch

## Architecture Notes

### Code Sharing Strategy

- **Root Package**: Contains pure Swift code that runs on any platform (command-line demo)
- **iOS Package**: Uses SwiftUI for iOS-native UI
- **Android Package**: Demonstrates Swift code compiled for Android

### Platform Differences

- **iOS**: Uses SwiftUI for UI, integrates with iOS SDK
- **Android**: Currently demonstrates command-line Swift code; UI integration would require bridging with Android UI frameworks (e.g., via JNI)

## Swift SDK for Android

This project leverages the new Swift SDK for Android announced in October 2025, which provides:
- Native ARM64 compilation for Android
- Standard library support for Android
- Interoperability with Android NDK

## Troubleshooting

### iOS Build Issues

- Ensure Xcode Command Line Tools are installed: `xcode-select --install`
- Check that you have the latest Xcode version
- Clean build folder: `swift package clean` or `Cmd+Shift+K` in Xcode

### Android Build Issues

- Verify ANDROID_HOME and ANDROID_NDK_HOME are set correctly
- Ensure NDK version 27.x or later is installed
- Check that Swift 6.2+ is in your PATH
- Verify the target triple matches your device architecture

### Common Errors

**"Cannot find Android NDK"**
```bash
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.3.13750724
```

**"Unable to cross-compile"**
- Ensure you have the Swift SDK for Android installed
- Verify the NDK sysroot path is correct

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

MIT License - See LICENSE file for details

## References

- [Swift.org - Swift SDK for Android](https://www.swift.org/blog/announcing-swift-sdk-android/)
- [Swift Package Manager Documentation](https://swift.org/package-manager/)
- [Android NDK Documentation](https://developer.android.com/ndk)
- [Xcode Documentation](https://developer.apple.com/documentation/xcode)