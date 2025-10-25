#!/bin/bash
# Script to build Swift code for iOS
# Requires Xcode and macOS

set -e

echo "Building iOS Swift package..."

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "Error: iOS builds require macOS and Xcode"
    exit 1
fi

# Check if Xcode is installed
if ! command -v xcodebuild &> /dev/null; then
    echo "Error: xcodebuild not found. Please install Xcode."
    exit 1
fi

echo "Xcode version:"
xcodebuild -version

# Build the package
echo "Building Swift package..."
swift build

echo "Build complete!"
echo "Binary location: .build/debug/HelloWorldiOS"

# Optional: Build for iOS Simulator
echo ""
echo "To build for iOS Simulator, you can use:"
echo "  xcodebuild -scheme HelloWorldiOS -destination 'platform=iOS Simulator,name=iPhone 15' build"
