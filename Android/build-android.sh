#!/bin/bash
# Script to build Swift code for Android
# Requires Swift 6.2+ and Android NDK

set -e

# Configuration
ANDROID_API_LEVEL=24
TARGET_TRIPLE="aarch64-unknown-linux-android${ANDROID_API_LEVEL}"

# Check prerequisites
if [ -z "$ANDROID_NDK_HOME" ]; then
    echo "Error: ANDROID_NDK_HOME is not set"
    echo "Please set it to your NDK installation path, e.g.:"
    echo "  export ANDROID_NDK_HOME=\$ANDROID_HOME/ndk/27.3.13750724"
    exit 1
fi

if [ ! -d "$ANDROID_NDK_HOME" ]; then
    echo "Error: ANDROID_NDK_HOME directory does not exist: $ANDROID_NDK_HOME"
    exit 1
fi

echo "Building for Android..."
echo "Target: $TARGET_TRIPLE"
echo "NDK: $ANDROID_NDK_HOME"

# Determine the host platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    NDK_PREBUILT="darwin-x86_64"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    NDK_PREBUILT="linux-x86_64"
else
    echo "Unsupported platform: $OSTYPE"
    exit 1
fi

SYSROOT="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$NDK_PREBUILT/sysroot"

if [ ! -d "$SYSROOT" ]; then
    echo "Error: NDK sysroot not found at $SYSROOT"
    exit 1
fi

# Build command
echo "Running swift build..."
swift build \
    --triple "$TARGET_TRIPLE" \
    --sdk "$SYSROOT" \
    -Xcc "-I$SYSROOT/usr/include" \
    -Xcc "-I$SYSROOT/usr/include/aarch64-linux-android"

echo "Build complete!"
echo "Binary location: .build/$TARGET_TRIPLE/debug/HelloWorldAndroid"
