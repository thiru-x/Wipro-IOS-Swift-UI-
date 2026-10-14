import SwiftUI

struct Student: Identifiable {
    let id = UUID()
    let name: String
    let mark: Int

    var result: String {
        mark >= 40 ? "Pass" : "Needs practice"
    }
}

struct StudentMarksView: View {
    private let students = [
        Student(name: "Anu", mark: 88),
        Student(name: "Bala", mark: 34),
        Student(name: "Charan", mark: 72),
        Student(name: "Divya", mark: 41)
    ]

    var averageMark: Double {
        guard !students.isEmpty else { return 0 }
        return Double(students.reduce(0) { $0 + $1.mark }) / Double(students.count)
    }

    var body: some View {
        NavigationStack {
            List {
                Section("Class Summary") {
                    LabeledContent("Students", value: "\(students.count)")
                    LabeledContent("Average", value: String(format: "%.1f", averageMark))
                }

                Section("Results") {
                    ForEach(students) { student in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(student.name).font(.headline)
                                Text("\(student.mark)/100")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Text(student.result)
                                .font(.subheadline.bold())
                                .foregroundStyle(student.mark >= 40 ? .green : .red)
                        }
                    }
                }
            }
            .navigationTitle("Student Marks")
        }
    }
}

#Preview {
    StudentMarksView()
}
