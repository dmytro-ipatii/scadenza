//
//  DSButton.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 06/08/2026.
//

import SwiftUI

public struct DSButton: View {
    private let label: String
    private let icon: ImageResource?
    private let isLoading: Bool
    private let isDisabled: Bool
    private let variant: DSButtonVariant
    public let action: () -> Void

    private var actionIsDisabled: Bool {
        isDisabled || isLoading
    }

    private var appearance: DSButtonAppearance {
        variant.appearance
    }

    public init(
        label: String,
        icon: ImageResource? = nil,
        variant: DSButtonVariant,
        isLoading: Bool = false,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.icon = icon
        self.isLoading = isLoading
        self.isDisabled = isDisabled
        self.variant = variant
        self.action = action
    }

    public var body: some View {
        Button(
            action: action,
            label: ({

                ZStack {

                    progressInidcatorView()
                        .opacity(isLoading ? 1.0 : 0.0)

                    content(label: label, icon: icon)
                        .opacity(isLoading ? 0.0 : 1.0)
                }
                .frame(height: appearance.buttonHeight)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, appearance.hoirizontalPadding)
                .background(
                    RoundedRectangle(cornerRadius: appearance.cornerRadius)
                        .fill(appearance.background)
                )
                .foregroundStyle(appearance.foregroud)
                .opacity(actionIsDisabled ? 0.5 : 1)
            })
        )
        .disabled(actionIsDisabled)
        .withGlassEfferct(isEnabled: appearance.usesGlassEffect)
    }

    @ViewBuilder private func progressInidcatorView() -> some View {
        ProgressView()
            .tint(appearance.foregroud)
    }

    @ViewBuilder private func content(label: String, icon: ImageResource?) -> some View {
        Label(
            title: ({
                Text(label)
                    .fontBody()
                    .fontWeight(.semibold)
                }),
            icon: ({
                if let icon = icon {
                    Image(icon)
                        .resizable()
                        .frame(width: appearance.iconSize.height, height: appearance.iconSize.width)
                        .tint(appearance.foregroud)
                }
            })
        )
    }

}


#Preview("Primary Button") {
    VStack {

        DSButton(
            label: "Primary Button",
            variant: .primary,
            action: ({ })
        )

        DSButton(
            label: "Primary Button",
            icon: .check,
            variant: .primary,
            action: ({ })
        )

        DSButton(
            label: "Primary Button",
            icon: .check,
            variant: .primary,
            isDisabled: true,
            action: ({ })
        )

        DSButton(
            label: "Primary Button",
            icon: .check,
            variant: .primary,
            isLoading: true,
            action: ({ })
        )
    }
}

#Preview("Secondary Button") {
    VStack {

        DSButton(
            label: "Secondary Button",
            variant: .secondary,
            action: ({ })
        )

        DSButton(
            label: "Secondary Button",
            icon: .check,
            variant: .secondary,
            action: ({ })
        )

        DSButton(
            label: "Secondary Button",
            icon: .check,
            variant: .secondary,
            isDisabled: true,
            action: ({ })
        )

        DSButton(
            label: "Secondary Button",
            icon: .check,
            variant: .secondary,
            isLoading: true,
            action: ({ })
        )

    }

}

#Preview("Accent Button") {
    VStack {
        DSButton(
            label: "Accent Button",
            variant: .accent,
            action: ({ })
        )

        DSButton(
            label: "Accent Button",
            icon: .check,
            variant: .accent,
            action: ({ })
        )

        DSButton(
            label: "Accent Button",
            icon: .check,
            variant: .accent,
            isDisabled: true,
            action: ({ })
        )

        DSButton(
            label: "Accent Button",
            icon: .check,
            variant: .accent,
            isLoading: true,
            action: ({ })
        )

    }
}

#Preview("Destructive Button") {
    VStack {

        DSButton(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            action: ({ })
        )

        DSButton(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            action: (({ }))
        )

        DSButton(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            isDisabled: true,
            action: ({ })
        )

        DSButton(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            isLoading: true,
            action: ({ })
        )

    }

}

#Preview("Text Button") {
    VStack {

        DSButton(
            label: "Text Button",
            variant: .textual,
            action: ({ })
        )

        DSButton(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            action: ({ })
        )

        DSButton(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            isDisabled: true,
            action: ({ })
        )

        DSButton(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            isLoading: true,
            action: ({ })
        )
    }

}
