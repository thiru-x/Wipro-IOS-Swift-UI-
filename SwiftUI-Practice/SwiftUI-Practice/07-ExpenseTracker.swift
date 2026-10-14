import SwiftUI

struct Expense: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let amount: Double
}

struct ExpenseTrackerView: View {
    private let expenses = [
        Expense(title: "Lunch", category: "Food", amount: 120),
        Expense(title: "Bus ticket", category: "Travel", amount: 35),
        Expense(title: "Notebook", category: "Study", amount: 80),
        Expense(title: "Coffee", category: "Food", amount: 60)
    ]

    private var total: Double {
        expenses.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Total Spent")
                            .foregroundStyle(.secondary)
                        Text(total, format: .currency(code: "INR"))
                            .font(.largeTitle.bold())
                    }
                    .padding(.vertical, 8)
                }

                Section("Recent Expenses") {
                    ForEach(expenses) { expense in
                        HStack {
                            Image(systemName: icon(for: expense.category))
                                .frame(width: 36, height: 36)
                                .background(.blue.opacity(0.12))
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                            VStack(alignment: .leading) {
                                Text(expense.title).font(.headline)
                                Text(expense.category)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Text(expense.amount, format: .currency(code: "INR"))
                                .fontWeight(.medium)
                        }
                    }
                }
            }
            .navigationTitle("Expense Tracker")
        }
    }

    private func icon(for category: String) -> String {
        switch category {
        case "Food": return "fork.knife"
        case "Travel": return "bus"
        case "Study": return "book"
        default: return "creditcard"
        }
    }
}

#Preview {
    ExpenseTrackerView()
}
