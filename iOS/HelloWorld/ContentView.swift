import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .padding()
            Text("Swift on iOS")
                .font(.title2)
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    ContentView()
}
