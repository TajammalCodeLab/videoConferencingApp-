import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

class CustomViewFactory: ViewFactory {
    // 1. Custom Call Controls
    public func makeCallControlsView(viewModel: CallViewModel) -> some View {
        AroundMeetingControlsView(viewModel: viewModel)
            .padding(.bottom)
    }
    
    // 2. Custom CallTopView
    public func makeCallTopView(viewModel: CallViewModel) -> some View {
        AroundMeetingTopView(viewModel: viewModel, participants: [])
            .padding(.bottom, 42)
    }
}
