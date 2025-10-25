#!/bin/bash
# Script to deploy Swift Android binary to device/emulator

set -e

BINARY_NAME="HelloWorldAndroid"
TARGET_TRIPLE="aarch64-unknown-linux-android24"
BUILD_PATH=".build/$TARGET_TRIPLE/debug/$BINARY_NAME"
DEVICE_PATH="/data/local/tmp/$BINARY_NAME"

echo "Swift Android Deployment Script"
echo "================================"

# Check if binary exists
if [ ! -f "$BUILD_PATH" ]; then
    echo "Error: Binary not found at $BUILD_PATH"
    echo "Please build the project first using: ./build-android.sh"
    exit 1
fi

# Check if adb is available
if ! command -v adb &> /dev/null; then
    echo "Error: adb not found. Please install Android SDK platform tools."
    exit 1
fi

# Check for connected devices
echo "Checking for connected devices..."
DEVICE_COUNT=$(adb devices | grep -c "device$" || true)

if [ "$DEVICE_COUNT" -eq 0 ]; then
    echo "Error: No Android devices connected"
    echo "Please connect a device or start an emulator"
    exit 1
fi

echo "Found $DEVICE_COUNT device(s)"
echo ""

# Push binary to device
echo "Deploying binary to device..."
adb push "$BUILD_PATH" "$DEVICE_PATH"

# Make executable
echo "Setting executable permissions..."
adb shell chmod +x "$DEVICE_PATH"

echo ""
echo "Deployment successful!"
echo ""
echo "To run the application:"
echo "  adb shell $DEVICE_PATH"
echo ""
echo "Running now..."
adb shell "$DEVICE_PATH"
