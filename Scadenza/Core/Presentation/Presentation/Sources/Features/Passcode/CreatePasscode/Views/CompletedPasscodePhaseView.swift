//
//  CompletedPasscodePhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct CompletedPasscodePhaseView: View {

    private var onComplete: () -> Void

    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }

    public var body: some View {
        DSConfirmationView(
            icon: .shieldCheck,
            title: "Your passcode is set",
            message: "Now you can use it to access your data securely.",
            actions: ({
                AnyView(
                    VStack {
                        DSButtonView(label: "Done", variant: .primary, action: onComplete)
                    }
                )
            })
        )

    }
}

#Preview {
    CompletedPasscodePhaseView(onComplete: ({}))
}
