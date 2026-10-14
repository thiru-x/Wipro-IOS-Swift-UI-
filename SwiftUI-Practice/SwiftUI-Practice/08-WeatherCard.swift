import SwiftUI

struct WeatherCardView: View {
    @State private var isCelsius = true

    private let temperatureCelsius = 29.0
    private var displayedTemperature: Int {
        isCelsius
            ? Int(temperatureCelsius)
            : Int(temperatureCelsius * 9 / 5 + 32)
    }

    var body: some View {
        VStack(spacing: 18) {
            Text("Coimbatore")
                .font(.title.bold())

            Text("Today")
                .foregroundStyle(.secondary)

            Image(systemName: "cloud.sun.fill")
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 72))

            Text("\(displayedTemperature)°\(isCelsius ? "C" : "F")")
                .font(.system(size: 54, weight: .light))

            Text("Partly cloudy")
                .font(.headline)

            HStack {
                Label("Humidity 68%", systemImage: "humidity")
                Spacer()
                Label("Wind 12 km/h", systemImage: "wind")
            }
            .font(.caption)
            .foregroundStyle(.secondary)

            Toggle("Show Fahrenheit", isOn: Binding(
                get: { !isCelsius },
                set: { isCelsius = !$0 }
            ))
            .padding(.top, 8)
        }
        .padding(24)
        .frame(maxWidth: 420)
        .background(
            LinearGradient(
                colors: [.blue.opacity(0.18), .cyan.opacity(0.08)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 28))
        .padding()
    }
}

#Preview {
    WeatherCardView()
}
