import SwiftUI

public struct ProfileView: View {

    // MARK: - Properties

    @ObservedObject var model: ProfileModel

    // MARK: - Initialization

    public init(model: ProfileModel) {
        self.model = model
    }

    // MARK: - View

    public var body: some View {
        Text("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(model: .init())
    }
}
