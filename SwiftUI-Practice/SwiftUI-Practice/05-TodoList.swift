import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted = false
}

struct TodoListView: View {
    @State private var newTask = ""
    @State private var tasks = [
        TodoItem(title: "Learn Swift variables"),
        TodoItem(title: "Practice SwiftUI layouts"),
        TodoItem(title: "Push code to GitHub")
    ]

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter a task", text: $newTask)
                        .textFieldStyle(.roundedBorder)

                    Button("Add", action: addTask)
                        .buttonStyle(.borderedProminent)
                        .disabled(newTask.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()

                List {
                    ForEach($tasks) { $task in
                        Toggle(task.title, isOn: $task.isCompleted)
                    }
                    .onDelete { tasks.remove(atOffsets: $0) }
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                EditButton()
            }
        }
    }

    private func addTask() {
        let title = newTask.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !title.isEmpty else { return }
        tasks.append(TodoItem(title: title))
        newTask = ""
    }
}

#Preview {
    TodoListView()
}
