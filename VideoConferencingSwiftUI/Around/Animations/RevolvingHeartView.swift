//
//  RevolvingHeartView.swift
//  RevolvingHearts
//
//  Created by Amos Gyamfi from getstream on 23.11.2021.
//

import SwiftUI

struct RevolvingHeartView: View {
    
    @State private var revolving = false
    
    var body: some View {
       
        VStack {
            VStack(spacing: 50) {
                ZStack {
                    ZStack {
                        Image("circular")
                        Image("heart_top")
                            // Rotation Mode: Do not rotate
                            .rotationEffect(.degrees(revolving ? -360 : 360))
                            .offset(x: 10, y: -20)
                            
                        Image("heart_bottom")
                            // Rotation Mode: Do not rotate
                            .rotationEffect(.degrees(revolving ? -360 : 360))
                            .offset(x: -25, y: 20)
                                
                    } // Circular
                    .rotationEffect(.degrees(revolving ? 360 : -360))
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: revolving)
                    .offset(x: 12.5, y: -20)
                    .onAppear {
                            revolving.toggle()
                    }
                }
            }
        }
            
    }
}

struct RevolvingHeartView_Previews: PreviewProvider {
    static var previews: some View {
        RevolvingHeartView()
            .preferredColorScheme(.dark)
    }
}
