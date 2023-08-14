//
//  File.swift
//  
//
//  Created by Bartek Pichalski on 14/08/2023.
//

import SwiftUI
import Common
import Profile

public struct AppView: View {
    public init() {}
    public var body: some View {
        TabView {
            Group {
                Color.red
                    .tabItem {
                        Label(title: {Text("Guild")}) {
                            Asset.Assets.adventureGuide.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Plants")}) {
                            Asset.Assets.plant.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Workbench")}) {
                            Asset.Assets.workbench.swiftUIImage
                        }
                    }
                Color.red
                    .tabItem {
                        Label(title: {Text("Shop")}) {
                            Asset.Assets.shop.swiftUIImage
                        }
                    }
                ProfileView()
                    .tabItem {
                        Label(title: {Text("Profile")}) {
                            Asset.Assets.profile.swiftUIImage
                        }
                    }
            }
        }
        .tint(Asset.Colors.appBrown.swiftUIColor)
    }
}

struct AppView_Preview: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
