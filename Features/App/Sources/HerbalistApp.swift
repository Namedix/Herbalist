import SwiftUI
import Tabs
import Common

@main
struct HerbalistApp: App {
    var body: some Scene {
        WindowGroup {
            TabsView(model: .init())
                .onAppear {
                    CommonFontFamily.registerAllCustomFonts()
                }
        }
    }
}
