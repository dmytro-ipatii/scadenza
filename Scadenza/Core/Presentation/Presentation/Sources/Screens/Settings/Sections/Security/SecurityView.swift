//
//  FaceIDAndPasscodeView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

struct SecurityView: View {

    @State var passsword: String = ""
    private let maxPasswordLength: Int = 6

    var body: some View {
        DSScreenView(
            content: (
                {
                    VStack {
//                        Text("Face ID & Passcode")
//                            .fontTitle()
//                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        CreatePasscodeView()



                        // No pass code configured screen
                        // Set-up passcode:
                        // Passcode screen -> repeat passcode screen -> passcode configured
                        
                        // Passcode configured
                        // Enable Face-ID:
                        // Face-ID settings screen
                        // Hide preview toggle
                        // Change passcode -> set-up passcode screen
                        // Remove passcode:
                        // Passcode verification screen -> No pass code configured screen
                        
                    }
                })
        )
        .navigationTitle("Face ID & Passcode")
        .navigationBarTitleDisplayMode(.inline)
    }
}




#Preview {
    NavigationStack {
        SecurityView()
    }
}
