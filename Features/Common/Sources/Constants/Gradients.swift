import SwiftUI

public extension LinearGradient {
    static var green: LinearGradient {
        Self(colors: [CommonAsset.Colors.appProfileBackground.swiftUIColor, CommonAsset.Colors.appGreen.swiftUIColor], startPoint: .top, endPoint: .bottom)
    }
}
