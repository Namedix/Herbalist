import SwiftUI
import Common

public struct ProfileView: View {

    // MARK: - Properties

    @ObservedObject var model: ProfileModel
    @State var headerHeight: CGFloat = 0

    // MARK: - Initialization

    public init(model: ProfileModel) {
        self.model = model
    }

    // MARK: - View

    public var body: some View {
        GeometryReader { proxy in
            ZStack {
                VStack {
                    ZStack(alignment: .topLeading) {
                        GeometryReader { proxy in
                            CommonAsset.Assets.profileBannerImage.swiftUIImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: proxy.size.width, height: headerHeight)
                                .clipped()
                        }
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Profile")
                                    .textStyle(.title)
                                ZStack(alignment: .trailing) {
                                    CommonAsset.Assets.herbs.swiftUIImage
                                    VStack(alignment: .leading, spacing: Margin.small) {
                                        Group {
                                            HStack {
                                                CommonAsset.Assets.fame.swiftUIImage
                                                Text("Your fame is ") + Text("257").bold() + Text("!")
                                            }
                                            HStack {
                                                CommonAsset.Assets.meatPlant.swiftUIImage
                                                Text("You already growed\n") + Text("12").bold() + Text(" plants.")
                                            }
                                        }
                                        .textStyle(.whiteSmallText)
                                    }
                                }
                                .padding(Margin.small)
                                .background(LinearGradient.green)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(.gray, lineWidth: 2)
                                )
                                .cornerRadius(CornerRadius.medium)
                            }
                            Spacer()
                            CommonAsset.Assets.profileHerbalist.swiftUIImage
                        }
                        .padding(.horizontal, Margin.big)
                        .padding(.top, 40)
                    }
                    Spacer()
                }
                .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                Section { } header: {
                    GeometryReader {
                        Color.clear.preference(
                            key: ViewOffsetKey.self,
                            value: $0.frame(in: .named("area")).maxY
                        )
                    }
                    .frame(height: proxy.size.height * 0.28)
                    .onPreferenceChange(ViewOffsetKey.self) {
                        headerHeight = $0 < proxy.size.height * 0.4 ? proxy.size.height * 0.4 : $0
                    }
                }
                VStack(spacing: Margin.medium) {
                    ProfileRowView(
                        image: CommonAsset.Assets.crown.swiftUIImage,
                        title: "Master Herbalist Support",
                        foregroundColor: CommonAsset.Colors.appWhite.swiftUIColor,
                        backgroundColor: nil,
                        backgroundGradient: .green
                    )
                    .padding(.top, Margin.large)
                    ProfileRowView(
                        image: CommonAsset.Assets.jurnal.swiftUIImage,
                        title: "Plant Jurnal"
                    )
                    Text("In jurnal you can find all plants thats are awailable in the game and where to find them!")
                        .textStyle(.brownSmallText)
                        .padding(.horizontal, Margin.small)
                    ProfileRowView(
                        image: CommonAsset.Assets.stabbedNote.swiftUIImage,
                        title: "Widget Settings"
                    )
                    VStack {
                        HStack(spacing: Margin.medium) {
                            CommonAsset.Assets.stars.swiftUIImage
                            Text("Rate us!")
                                .font(TextStyle.text.font)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .bold()
                        }
                        Divider()
                            .padding(.leading, Margin.huge)
                        HStack(spacing: Margin.medium) {
                            CommonAsset.Assets.scroll.swiftUIImage
                            Text("Send feedback")
                                .font(TextStyle.text.font)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .bold()
                        }
                    }
                    .foregroundColor(CommonAsset.Colors.appBrown.swiftUIColor)
                    .padding(.vertical, Margin.medium)
                    .padding(.horizontal, Margin.big)
                    .background(color: CommonAsset.Colors.appWhite.swiftUIColor)
                    .cornerRadius(CornerRadius.medium)
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 1)
                    ProfileRowView(
                        image: CommonAsset.Assets.tree.swiftUIImage,
                        title: "Restore Purchases",
                        foregroundColor: CommonAsset.Colors.appGreen.swiftUIColor
                    )
                    Text("If you bought Master Herbalist Support on other device you can restore your subscription here.")
                        .textStyle(.brownSmallText)
                        .padding(.horizontal, Margin.small)
                }
                .padding(.horizontal, Margin.big)
                .fullWidth()
                .background(CommonAsset.Colors.appWhite.swiftUIColor)
                .cornerRadius(CornerRadius.big)
            }
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: .init())
    }
}
