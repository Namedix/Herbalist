import SwiftUI

public extension View {
    func background(color: Color) -> some View {
        background(color.edgesIgnoringSafeArea(.all))
    }

    func fullWidth(alignment: Alignment = .center) -> some View {
        frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }

    func fullHeight(alignment: Alignment = .center) -> some View {
        frame(minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }
}
