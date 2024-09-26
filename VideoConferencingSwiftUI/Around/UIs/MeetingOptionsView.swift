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
            VStack {
                NavigationLink {
                    PreJoinScreen()
                } label: {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .font(.title2)
                        
                        Text("New Meeting")
                    }
                    .padding()
                    .frame(width: 180, height: 80)
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
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


