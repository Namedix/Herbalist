import SwiftUI
import Common
import Profile

public struct TabsView: View {

    // MARK: - Properties

    @ObservedObject var model: TabsModel

    // MARK: - Initialization

    public init(model: TabsModel) {
        self.model = model
    }

    // MARK: - View

    public var body: some View {
        TabView {
            Group {
                Color.red
                    .tabItem {
                        Label(title: {Text("Guild")}) {
                            CommonAsset.Assets.adventureGuide.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Plants")}) {
                            CommonAsset.Assets.plant.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Workbench")}) {
                            CommonAsset.Assets.workbench.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Shop")}) {
                            CommonAsset.Assets.shop.swiftUIImage
                        }
                    }
                ProfileView(model: .init())
                    .tabItem {
                        Label(title: {Text("Profile")}) {
                            CommonAsset.Assets.profile.swiftUIImage
                        }
                    }
            }
        }
        .tint(CommonAsset.Colors.appBrown.swiftUIColor)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView(model: .init())
    }
}
