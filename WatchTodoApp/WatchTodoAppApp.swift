import SwiftUI
import WidgetKit

struct WatchPluginWidget: Widget {
    let kind: String = "WatchTodoApp_Plugin"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WatchPluginView(entry: entry)
        }
        .configurationDisplayName("Todo Shortcut")
        .description("Quick access plugin for your daily tasks.")
        .supportedFamilies([.accessoryCircular, .accessoryCorner, .accessoryRectangular])
    }
}

struct WatchPluginView: View {
    var entry: Provider.Entry

    var body: some View {
        Image(systemName: "checkmark.circle.capsule")
            .resizable()
            .padding(4)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        let timeline = Timeline(entries: [SimpleEntry(date: Date())], policy: .atEnd)
        completion(timeline)
    }
}

@main
struct WatchTodoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
