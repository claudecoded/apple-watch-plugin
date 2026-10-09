import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var items = [
        TodoItem(title: "Drink Water", isCompleted: false),
        TodoItem(title: "30-min Workout", isCompleted: true)
    ]
    
    var body: some View {
        NavigationStack {
            List($items) { $item in
                HStack {
                    Text(item.title)
                        .strikethrough(item.isCompleted)
                    Spacer()
                    Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                }
                .onTapGesture { item.isCompleted.toggle() }
            }
            .navigationTitle("Tasks")
        }
    }
}
