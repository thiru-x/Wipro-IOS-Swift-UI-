import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 110)
                .foregroundStyle(.blue)

            Text("Alex Kumar")
                .font(.title.bold())

            Text("Computer Science Student")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Learning SwiftUI and building useful apps.")
                .multilineTextAlignment(.center)

            HStack(spacing: 24) {
                profileStat(number: "08", label: "Projects")
                profileStat(number: "12", label: "Commits")
                profileStat(number: "03", label: "Skills")
            }
            .padding(.top, 8)

            Button {
                print("Profile button tapped")
            } label: {
                Text("View Profile")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(24)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .padding()
    }

    private func profileStat(number: String, label: String) -> some View {
        VStack(spacing: 4) {
            Text(number).font(.headline)
            Text(label).font(.caption).foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ProfileCardView()
}
