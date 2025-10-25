// Swift Cross-Platform Hello World
// Demonstrates shared Swift code that runs on any platform

// String multiplication extension for prettier output
extension String {
    static func *(lhs: String, rhs: Int) -> String {
        return String(repeating: lhs, count: rhs)
    }
}

@main
struct HelloWorld {
    static func main() {
        print("=" * 50)
        print("Swift Cross-Platform Hello World")
        print("=" * 50)
        print("Hello, world!")
        print("")
        print("Platform: \(getPlatform())")
        print("Swift Version: \(getSwiftVersion())")
        print("")
        print("This same Swift code runs on:")
        print("  • Linux (native)")
        print("  • macOS (native)")
        print("  • iOS (via Swift Package)")
        print("  • Android (via Swift SDK)")
        print("=" * 50)
    }
    
    static func getPlatform() -> String {
        #if os(Linux)
        return "Linux"
        #elseif os(macOS)
        return "macOS"
        #elseif os(iOS)
        return "iOS"
        #elseif os(Android)
        return "Android"
        #else
        return "Unknown"
        #endif
    }
    
    static func getSwiftVersion() -> String {
        #if swift(>=6.2)
        return "6.2+"
        #elseif swift(>=6.0)
        return "6.0+"
        #elseif swift(>=5.9)
        return "5.9+"
        #else
        return "< 5.9"
        #endif
    }
}
