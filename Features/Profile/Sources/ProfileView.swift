import SwiftUI
import Common

public struct ProfileView: View {

    // MARK: - Properties

    @ObservedObject var model: ProfileModel

    // MARK: - Initialization

    public init(model: ProfileModel) {
        self.model = model
    }

    // MARK: - View

    public var body: some View {
        VStack {
            ZStack {
                CommonAsset.Assets.profileBannerImage.swiftUIImage
                    .edgesIgnoringSafeArea(.all)
                Text("Profile")
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: .init())
    }
}
