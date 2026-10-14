import SwiftUI

struct CounterAppView: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 24) {
            Text("Counter App")
                .font(.largeTitle.bold())

            Text("\(count)")
                .font(.system(size: 72, weight: .bold, design: .rounded))
                .contentTransition(.numericText())

            HStack(spacing: 20) {
                Button {
                    count -= 1
                } label: {
                    Label("Decrease", systemImage: "minus")
                }
                .buttonStyle(.bordered)

                Button {
                    count += 1
                } label: {
                    Label("Increase", systemImage: "plus")
                }
                .buttonStyle(.borderedProminent)
            }

            Button("Reset") {
                count = 0
            }
            .tint(.red)
        }
        .padding()
    }
}

#Preview {
    CounterAppView()
}
