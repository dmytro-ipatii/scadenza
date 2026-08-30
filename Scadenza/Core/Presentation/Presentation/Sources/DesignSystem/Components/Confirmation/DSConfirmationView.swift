//
//  DSConfirmationView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct DSConfirmationView<Actions: View>: View {
    private var icon: ImageResource
    private var title: String
    private var message: String?
    private var actions: Actions

    public init(
        icon: ImageResource,
        title: String,
        message: String,
        actions: (() -> Actions) = { EmptyView() }
    ) {
        self.icon = icon
        self.title = title
        self.message = message
        self.actions = actions()
    }

    public var body: some View {
        VStack(spacing: DSSpace.lg) {
            DSIconBadgeView(
                variant: .other(
                    appearance: .init(
                        icon: icon,
                        iconColor: DSColor.success,
                        background: DSColor.successTit
                    )
                ),
                size: .large
            )
            .frame(width: 88)

            VStack {
                Text(title)
                    .fontTitle()
                    .foregroundStyle(DSColor.textPrimary)

                if let message {
                    Text(message)
                        .fontSecondary()
                        .foregroundStyle(DSColor.textSecondary)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: 300)

            actions

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview("Preview") {
    DSConfirmationView(
        icon: .shieldCheck,
        title: "Your passcode is set",
        message: "Now you can use it to access your data securely."
    )

}

#Preview("With actions") {
    DSConfirmationView(
        icon: .shieldCheck,
        title: "Your passcode is set",
        message: "Now you can use it to access your data securely.",
        actions: ({
            AnyView(
                VStack {
                    DSButtonView(label: "Close", variant: .primary, action: {})
                }
            )
        })
    )

}
