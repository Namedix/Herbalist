import SwiftUI
import Common

struct ProfileRowView: View {

    // MARK: - Properties

    let image: Image
    let title: String
    let foregroundColor: Color
    let backgroundColor: Color?
    let backgroundGradient: LinearGradient?

    // MARK: - Initialization

    init(
        image: Image,
        title: String,
        foregroundColor: Color = CommonAsset.Colors.appBrown.swiftUIColor,
        backgroundColor: Color? = CommonAsset.Colors.appWhite.swiftUIColor,
        backgroundGradient: LinearGradient? = nil
    ) {
        self.image = image
        self.title = title
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.backgroundGradient = backgroundGradient
    }

    // MARK: - View

    var body: some View {
        HStack(spacing: Margin.medium) {
            image
            Text(title)
                .font(TextStyle.text.font)
            Spacer()
            Image(systemName: "chevron.right")
                .bold()
        }
        .foregroundColor(foregroundColor)
        .padding(.vertical, Margin.medium)
        .padding(.horizontal, Margin.big)
        .frame(height: 60)
        .background(background)
        .cornerRadius(CornerRadius.medium)
        .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 1)
    }

    // MARK: Subviews

    var background: some View {
        if let backgroundColor = backgroundColor {
            return AnyView(backgroundColor)
        } else if let backgroundGradient = backgroundGradient {
            return AnyView(backgroundGradient)
        }
        return AnyView(CommonAsset.Colors.appWhite.swiftUIColor)
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRowView(image: CommonAsset.Assets.stabbedNote.swiftUIImage, title: "Widget Settings")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
