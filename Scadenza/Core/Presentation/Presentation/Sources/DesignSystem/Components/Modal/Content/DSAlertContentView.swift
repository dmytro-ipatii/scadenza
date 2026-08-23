//
//  DSAlertContentView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSAlertContentView: View {
    private let content: ModalContent

    public init(
        content: ModalContent
    ) {
        self.content = content
    }

    public var body: some View {
        VStack(alignment: .center, spacing: DSSpace.xl) {

            if let iconBadgeVariant = content.iconBadge {
                iconBadgeView(iconBadgeVariant)
            }

            VStack(spacing: DSSpace.xxs) {
                titleView

                if let message = content.message {
                    messageView(message)
                }
            }

            VStack {
                ForEach(content.buttons) { button in
                    DSButtonView(
                        label: button.label,
                        variant: button.variant,
                        action: button.action
                    )

                }
            }

        }
        .padding(DSSpace.lg)
        .frame(maxWidth: 340)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.lg)
                .fill(DSColor.surfaceSecondary)
        )

    }

    private func iconBadgeView(_ iconBadgeVariant: DSIconBadgeVariant) -> some View {
        DSIconBadgeView(variant: iconBadgeVariant)
        .frame(height: 56)
    }

    private var titleView: some View {
        Text(content.title)
            .fontSection()
            .foregroundStyle(DSColor.textPrimary)
            .frame(maxWidth: .infinity, alignment: .center)
    }

    private func messageView(_ message: String) -> some View {
        Text(message)
            .fontSecondary()
            .foregroundStyle(DSColor.textSecondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview("Danger") {
    VStack {
        DSAlertContentView(
            content: .init(
                icon: .trash,
                title: "Delete document?",
                variant: .danger,
                message: "«RC Auto · Fiat Panda» and its attachment will be removed from this iPhone.",
                buttons: [
                    ModalButton(label: "Delete", variant: .destructive, action: ({})),

                    ModalButton(label: "Cancel", variant: .textual, action: ({})),
                ]
            )
        )
    }
}

#Preview("Warning") {
    VStack {
        DSAlertContentView(
            content: .init(
                icon: .exclamation,
                title: "Document about to expire.",
                variant: .warning,
                message: "The document will expire soon, and require your attention.",
                buttons: [
                    ModalButton(label: "OK", variant: .primary, action: ({}))
                ]
            )
        )
    }
}

#Preview("Neutral") {
    VStack {
        DSAlertContentView(
            content: .init(
                title: "Document about to expire.",
                variant: .neutral,
                message: "The document will expire soon, and require your attention.",
                buttons: [
                    ModalButton(label: "OK", variant: .primary, action: ({}))
                ]
            )
        )
    }
}
