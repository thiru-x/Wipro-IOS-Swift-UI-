import SwiftUI

struct HelloSwiftUIView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "swift")
                .font(.system(size: 64))
                .foregroundStyle(.orange)

            Text("Hello, SwiftUI!")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("My first SwiftUI practice screen.")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Button("Start Learning") {
                print("Let's learn SwiftUI!")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    HelloSwiftUIView()
}
