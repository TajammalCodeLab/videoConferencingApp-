//
//  PreJoinScreen.swift
//  SwiftUIAroundClone
//
//  Created by amos.gyamfi@getstream.io on 10.7.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct PreJoinScreen: View {
    @State private var audioOn = false
    @State private var videoOn = false
    @State private var isJoined = false
    let borderGradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
    
    var participants: CallParticipant?
    var size: CGSize = .init(width: 140, height: 180)
    
    var body: some View {
        VStack {
            if !videoOn {
                Image(.sonoma)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 180, height: 180)
                    .overlay(Circle().stroke().foregroundStyle(borderGradient))
            } else {
                //FloatingParticipantView()
                HostedViewController()
                    .clipShape(Circle())
                    .frame(width: 180, height: 180)
                    .overlay(Circle().stroke())
                    .overlay(Circle().stroke().foregroundStyle(borderGradient))
            }
            
            Spacer()
            
            Text("Set how you would like to join the meeting")
            
            Spacer()
            
            // Toggles
            HStack(spacing: 80) {
                Toggle(isOn: $audioOn) {
                    Image(systemName: audioOn ? "mic.fill" : "mic.slash.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(audioOn ? .green : .primary)
                        .contentTransition(.symbolEffect(.replace.byLayer))
                }
                .frame(width: 80)
                
                Toggle(isOn: $videoOn) {
                    Image(systemName: videoOn ? "video.fill" : "video.slash.fill")
                        .symbolRenderingMode(.hierarchical)
                        .foregroundColor(videoOn ? .green : .primary)
                        .contentTransition(.symbolEffect(.replace.byLayer))
                }
                .frame(width: 80)
            }
            
            Spacer()
            
            Button {
                //VideoRendererSetup()
                isJoined.toggle()
            } label: {
                Capsule()
                    .frame(width: 240, height: 48)
                    .overlay(audioOn ? Text("Join").foregroundColor(.white) : Text("Join muted").foregroundColor(.white))
                    .contentTransition(.interpolate)
            }
            .fullScreenCover(isPresented: $isJoined, content: CallContainerSetup.init)
            
            Spacer()
            
            HStack {
                Image(systemName: "circle")
                Text("Skip this step for future meetings")
            }
            
            Spacer()
        }
    }
}
