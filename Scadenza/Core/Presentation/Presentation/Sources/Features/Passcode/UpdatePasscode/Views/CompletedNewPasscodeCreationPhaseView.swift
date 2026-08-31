//
//  CompletedNewPasscodeCreationPhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 31/08/2026.
//

import SwiftUI

public struct CompletedNewPasscodeCreationPhaseView: View {

    private var onComplete: () -> Void

    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    public var body: some View {
        DSConfirmationView(
            icon: .shieldCheck,
            title: "Your new passcode is set",
            message: "Now you can use it to access your data securely.",
            actions: ({
                AnyView(
                    VStack {
                        DSButtonView(label: "Go back", variant: .primary, action: onComplete)
                    }
                )
            })
        )

    }
}

#Preview {
    CompletedNewPasscodeCreationPhaseView(onComplete: ({}))
}
