# Quick Start Guide

This guide will help you get started with the Swift cross-platform Hello World app.

## Quick Test (Any Platform)

The fastest way to test this project is to build and run the shared command-line demo:

```bash
# Clone the repository
git clone https://github.com/jgutierrezdtt/swift_android.git
cd swift_android

# Build and run
swift build
./.build/debug/HelloWorld
```

You should see: `Hello, world!`

## iOS Quick Start (macOS only)

```bash
# Navigate to iOS directory
cd iOS

# Build
swift build

# Or open in Xcode
open Package.swift
# Then press Cmd+R to run
```

## Android Quick Start (Linux/macOS)

### Prerequisites Setup

1. **Install Swift 6.2+**
   ```bash
   # macOS
   brew install swift
   
   # Linux (Ubuntu/Debian)
   # Download from https://www.swift.org/download/
   ```

2. **Set up Android NDK**
   ```bash
   export ANDROID_HOME=/path/to/android-sdk
   export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.3.13750724
   ```

### Build for Android

```bash
# Navigate to Android directory
cd Android

# Run the build script
./build-android.sh
```

### Deploy to Android Device

```bash
# Ensure device is connected
adb devices

# Push and run the app
adb push .build/aarch64-unknown-linux-android24/debug/HelloWorldAndroid /data/local/tmp/
adb shell chmod +x /data/local/tmp/HelloWorldAndroid
adb shell /data/local/tmp/HelloWorldAndroid
```

You should see:
```
Hello, world from Android!
This is a Swift application running on Android
Built with Swift SDK for Android (October 2025)
```

## Troubleshooting

### "Swift not found"
Install Swift from https://www.swift.org/download/

### "Cannot find Android NDK"
Set the ANDROID_NDK_HOME environment variable:
```bash
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk/27.3.13750724
```

### "xcodebuild not found"
Install Xcode from the Mac App Store (macOS only)

## Next Steps

- See [README.md](README.md) for detailed setup instructions
- Check [.github/workflows/](.github/workflows/) for CI/CD configuration
- Explore the source code in [Sources/](Sources/), [iOS/](iOS/), and [Android/](Android/)
