//
//  MeetingOptionsView.swift
//  SwiftUIAroundClone
//
//  Created by amos.gyamfi@getstream.io on 18.7.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct MeetingOptionsView: View {
    let borderGradient = LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink {
                    PreJoinScreen()
                } label: {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .rotationEffect(.degrees(90))
                        }
                        
                        Spacer()
                        
                        Text("New Meeting")
                    }
                    .padding()
                    .frame(width: 160, height: 160)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
                }
            }
            
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    Text("New Meeting")
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(.sonoma)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 42, height: 42)
                        .overlay(Circle().stroke().foregroundStyle(borderGradient))
                }
            }
        }
    }
}


