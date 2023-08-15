import SwiftUI
import Tabs

@main
struct HerbalistApp: App {
    var body: some Scene {
        WindowGroup {
            TabsView(model: .init())
        }
    }
}
