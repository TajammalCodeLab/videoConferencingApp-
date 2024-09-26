//
//  RendererExtension.swift
//  VideoConferencingSwiftUI
//
//  Created by amos.gyamfi@getstream.io on 19.9.2023.
//

import Foundation
import StreamVideo
import StreamVideoSwiftUI
import UIKit

extension VideoRenderer {

    func handleViewRendering(
        for participant: CallParticipant,
        onTrackSizeUpdate: @escaping (CGSize, CallParticipant) -> ()
    ) {
        if let track = participant.track {
            log.debug("adding track to a view \(self)")
            self.add(track: track)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                let prev = participant.trackSize
                let scale = UIScreen.main.scale
                let newSize = CGSize(
                    width: self.bounds.size.width * scale,
                    height: self.bounds.size.height * scale
                )
                if prev != newSize {
                    onTrackSizeUpdate(newSize, participant)
                }
            }
        }
    }

}
