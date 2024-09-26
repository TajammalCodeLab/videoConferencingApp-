//
//  ReactionsWithPhaseAnimator.swift
//  OpenSwiftUIAnimations
//


import SwiftUI

// Create a list of steps for the animation
enum Reaction: CaseIterable {
    // Define the phases of the animation
    // Initial appearance, move the view up and scale
    case initial, move, scale
    
    // Create a computed properties for the effects you want to have
    var verticalOffset: Double {
        switch self {
        case .initial: 0
        case .move, .scale: -64
        }
    }
    
    var scale: Double {
        switch self {
        case .initial: 1
        case .move, .scale: 2.0
        }
    }
    
    var chromaRotate: Double {
        switch self {
        case .initial: 0.0
        case .move, .scale: 225.0
        }
    }
}

struct ReactionsWithPhaseAnimator: View {
    @State private var reactionCount = 0
    
    var body: some View {
        HStack {
            Text("🔥")
            Text("💞")
            
            Button{
                reactionCount += 1
            } label: {
                Text("🤗")
            }
            .phaseAnimator(
                Reaction.allCases,
                trigger: reactionCount // Observe this for changes
            ) { content, phase in
                content
                    .scaleEffect(phase.scale)
                    .offset(y: phase.verticalOffset)
                    .hueRotation(.degrees(phase.chromaRotate))
            } animation: { phase in
                switch phase {
                case .initial: .smooth
                case .move: .easeInOut(duration: 0.3).delay(0.25)
                case .scale: .spring(
                    duration: 0.5, bounce: 0.7)
                /*case .scale: .bouncy(
                    duration: 0.3,
                    extraBounce: 0.7)*/
                }
            }
        }
        .font(.largeTitle)
        .frame(height: 400)
    }
}

#Preview {
    ReactionsWithPhaseAnimator()
        .preferredColorScheme(.dark)
}
