import SwiftUI

public struct TextStyle {
    public let font: Font
    public let color: Color

    public init(
        font: Font,
        color: Color
    ) {
        self.font = font
        self.color = color
    }
}

extension View {
    public func textStyle(_ style: TextStyle) -> some View {
        return AnyView(
            font(style.font)
                .foregroundColor(style.color)
        )
    }
}


public extension TextStyle {
    static var title: TextStyle {
        Self(font: CommonFontFamily.Lato.bold.swiftUIFont(size: 42), color: CommonAsset.Colors.appWhite.swiftUIColor)
    }

    static var text: TextStyle {
        Self(font: CommonFontFamily.Lato.bold.swiftUIFont(size: 18), color: CommonAsset.Colors.appBrown.swiftUIColor)
    }

    static var brownSmallText: TextStyle {
        Self(font: CommonFontFamily.Lato.regular.swiftUIFont(size: 12), color: CommonAsset.Colors.appBrown.swiftUIColor)
    }

    static var whiteSmallText: TextStyle {
        Self(font: CommonFontFamily.Lato.regular.swiftUIFont(size: 12), color: CommonAsset.Colors.appWhite.swiftUIColor)
    }
}
