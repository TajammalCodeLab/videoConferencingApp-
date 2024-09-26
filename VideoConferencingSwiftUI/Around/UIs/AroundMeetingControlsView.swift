//
//  AroundMeetingControlsView.swift

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct AroundMeetingControlsView: View {

    @ObservedObject var viewModel: CallViewModel
    @State private var isScreenSharing = false
    @State private var isRecording = false
    @State private var isVideo = true
    @State private var isAudio = true
    @State private var isFront = true
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 20) {
            Button {
                viewModel.toggleCameraEnabled()
                isVideo.toggle()
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: isVideo ? "video.fill" : "video.slash.fill")
                        .contentTransition(.symbolEffect(.replace))
                        .frame(height: 48)
                    
                    withAnimation {
                        Text(isVideo ? "Video on" : "Video off")
                            .font(.caption)
                            .contentTransition(.interpolate)
                    }
                }
            }
            .buttonStyle(.plain)
            .frame(width: 54)
            
            Button {
                viewModel.toggleMicrophoneEnabled()
                isAudio.toggle()
            } label: {
                VStack(spacing: 12) {
                    //Image(systemName: isAudio ? "mic.fill" : "mic.slash.fill")
                    Image(systemName: isAudio ? "mic.fill" : "mic.slash.fill")
                        .contentTransition(.symbolEffect(.replace))
                        .frame(height: 48)
                    
                    withAnimation {
                        Text(isAudio ? "Mute" : "Unmute")
                            .font(.caption)
                            .monospacedDigit()
                            .contentTransition(.interpolate)
                    }
                }
            }
            .buttonStyle(.plain)
            .frame(width: 48)
            
            Button {
                viewModel.toggleCameraPosition()
                isFront.toggle()
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: isFront ? "camera.on.rectangle.fill" : "camera.metering.matrix")
                        .frame(height: 48)
                        .contentTransition(.interpolate)
                    
                    withAnimation {
                        Text(isFront ? "Front" : "Back")
                            .font(.caption)
                            .contentTransition(.interpolate)
                    }
                }
            }
            .buttonStyle(.plain)
            .frame(width: 42)
            
            Button {
                // Implement recording later
                
                isRecording.toggle()
            } label: {
                VStack(spacing: 12) {
                    if !isRecording {
                        Image(systemName: "record.circle")
                            .frame(height: 48)
                        
                        withAnimation {
                            Text(isRecording ? "stop" : "Record")
                                .font(.caption)
                                .contentTransition(.interpolate)
                        }
                        
                    } else {
                        Image(systemName: "record.circle")
                            .foregroundStyle(.red)
                            .frame(height: 48)
                        
                        withAnimation {
                            Text(isRecording ? "Stop" : "Record")
                                .font(.caption)
                                .contentTransition(.interpolate)
                        }
                    }
                }
            }
            .buttonStyle(.plain)
            .frame(width: 42)
            
            Button {
                isScreenSharing ? viewModel.stopScreensharing() : viewModel.startScreensharing(type: .inApp)
                isScreenSharing.toggle()
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: isScreenSharing ? "shared.with.you.slash": "shared.with.you")
                    .foregroundStyle(isScreenSharing ? .red : .white)
                        .contentTransition(.symbolEffect(.replace))
                        .frame(height: 48)
                    
                    withAnimation {
                        Text(isScreenSharing ? "Stop" : "Share")
                            .font(.caption)
                            .contentTransition(.interpolate)
                    }
                }
            }
            .buttonStyle(.plain)
            .frame(width: 42)
            
            Button {
              
            } label: {
                VStack(spacing: 12) {
                    Image(systemName: "face.dashed.fill")
                        .frame(height: 48)
                    Text("Reactions")
                        .font(.caption)
                }
            }
            .buttonStyle(.plain)
            .frame(width: 64)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 74)
        .padding(.bottom)
        .background(.quaternary)
    }
}

