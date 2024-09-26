//
//  CallContainerSetup.swift
//  VideoConferencingSwiftUI
//
//  Created by amos.gyamfi@getstream.io on 18.9.2023.
//

import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct CallContainerSetup: View {
    @ObservedObject var viewModel: CallViewModel
    
    private var client: StreamVideo
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "Jabba_The_Hutt" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL0phYmJhX1RoZV9IdXR0IiwidXNlcl9pZCI6IkphYmJhX1RoZV9IdXR0IiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3MjcyNzE2OTIsImV4cCI6MTcyNzg3NjQ5Mn0.384NNLm_G2bdu18M2TmhHpSmfwTP-NBi1lDX21ATOuQ" // The Token can be found in the Credentials section
    private let callId: String = "AoIVTQ00orVv" // The CallId can be found in the Credentials section
    
    init() {
        let user = User(
            id: userId,
            name: "From Xcode", // name and imageURL are used in the UI
            imageURL: .init(string: "https://pbs.twimg.com/profile_images/1305957506821189632/jkfoDUVz_400x400.jpg")
        )
        
        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )
        
        self.viewModel = .init()
    }
    
    var body: some View {
        NavigationView{
            VStack {
                if viewModel.call != nil {
                    //CallContainer(viewFactory: DefaultViewFactory.shared, viewModel: viewModel)
                    
                    CallContainer(viewFactory: CustomViewFactory(), viewModel: viewModel)
                } else {
                    Text("loading...")
                }
            }
            .ignoresSafeArea()
            .onAppear {
                Task {
                    guard viewModel.call == nil else { return }
                    viewModel.joinCall(callType: .default, callId: callId)
                }
            }
        }
        
    }
}



