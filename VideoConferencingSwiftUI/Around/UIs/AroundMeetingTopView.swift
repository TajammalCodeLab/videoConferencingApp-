//
//  AroundMeetingTopView.swift
//  BasicAdvancedTheming
//
//  Created by amos.gyamfi@getstream.io on 11.9.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct AroundMeetingTopView: View {
    @ObservedObject var viewModel: CallViewModel
    var participants: [CallParticipant]
    
    var body: some View {
        HStack {
            
            HStack {
                Image(systemName: "person.3")
                Text("\(viewModel.participants.count)")
            }
            
            Spacer()
            
            Button {
                //HangUpIconView(viewModel: viewModel)
                viewModel.hangUp()
            } label: {
                Text("Leave")
                    .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
                    .foregroundStyle(.white)
                    .background(Capsule().foregroundStyle(.red))
            }
            .buttonStyle(.plain)
        }
        .padding(EdgeInsets(top: 64, leading: 16, bottom: 24, trailing: 16))
    }
}


