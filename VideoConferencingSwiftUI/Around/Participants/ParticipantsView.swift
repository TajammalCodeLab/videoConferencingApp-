//
//  ParticipantsView.swift
//  VideoConferencingSwiftUI
//
//  Created by amos.gyamfi@getstream.io on 18.9.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct ParticipantsView: View {
    
    var call: Call
    var participants: [CallParticipant]
    var onChangeTrackVisibility: (CallParticipant?, Bool) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            if !participants.isEmpty {
                ScrollView {
                    LazyVStack {
                        if participants.count == 1, let participant = participants.first {
                            makeCallParticipantView(participant, size: proxy.size)
                                .frame(width: proxy.size.width, height: proxy.size.height)
                        } else {
                            ForEach(participants) { participant in
                                makeCallParticipantView(participant, size: proxy.size)
                                    .frame(width: proxy.size.width, height: proxy.size.height / 2)
                            }
                        }
                    }
                }
            } else {
                Color.black
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    @ViewBuilder
    private func makeCallParticipantView(_ participant: CallParticipant, size: CGSize) -> some View {
        VideoCallParticipantView(
            participant: participant,
            availableSize: size,
            contentMode: .scaleAspectFit,
            customData: [:],
            call: call
        )
        .onAppear { onChangeTrackVisibility(participant, true) }
        .onDisappear{ onChangeTrackVisibility(participant, false) }
    }
}
