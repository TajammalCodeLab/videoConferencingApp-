
import SwiftUI
import StreamVideo
import StreamVideoSwiftUI

struct VideoClientSetUp: View {
    @State var call: Call
    @ObservedObject var state: CallState
    @State var callCreated: Bool = false

    private var client: StreamVideo
    
    private let apiKey: String = "mmhfdzb5evj2" // The API key can be found in the Credentials section
    private let userId: String = "Jabba_The_Hutt" // The User Id can be found in the Credentials section
    private let token: String = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJodHRwczovL3Byb250by5nZXRzdHJlYW0uaW8iLCJzdWIiOiJ1c2VyL0phYmJhX1RoZV9IdXR0IiwidXNlcl9pZCI6IkphYmJhX1RoZV9IdXR0IiwidmFsaWRpdHlfaW5fc2Vjb25kcyI6NjA0ODAwLCJpYXQiOjE3MjcyNzE2OTIsImV4cCI6MTcyNzg3NjQ5Mn0.384NNLm_G2bdu18M2TmhHpSmfwTP-NBi1lDX21ATOuQ" // The Token can be found in the Credentials section
    private let callId: String = "AoIVTQ00orVv" // The CallId can be found in the Credentials section

    init() {
        let user = User(
            id: userId,
            name: "videoClientSetUp", // name and imageURL are used in the UI
            imageURL: .init(string: "https://getstream.io/static/2796a305dd07651fcceb4721a94f4505/a3911/martin-mitrevski.webp")
        )

        // Initialize Stream Video client
        self.client = StreamVideo(
            apiKey: apiKey,
            user: user,
            token: .init(stringLiteral: token)
        )

        // Initialize the call object
        let call = client.call(callType: "default", callId: callId)

        self.call = call
        self.state = call.state
    }

    var body: some View {
       
            VStack {
                if callCreated {
                    Text("Meeting Call \(call.callId) has \(call.state.participants.count) participant")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                } else {
                    VStack {
                        ProgressView()
                        Text("loading...")
                    }
                }
            }.onAppear {
                Task {
                    guard !callCreated else { return }
                    try await call.join(create: true)
                    callCreated = true
                }
           
        }
    }
}
