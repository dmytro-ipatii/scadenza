//
//  DSButton.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 06/08/2026.
//

import SwiftUI

public struct DSButtonView: View {
    private let label: String
    private let icon: ImageResource?
    private let isLoading: Bool
    private let isDisabled: IsDisabled
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
        isDisabled: IsDisabled = false,
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
                .opacity((actionIsDisabled as IsDisabled).opacityValue)
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

        DSButtonView(
            label: "Primary Button",
            variant: .primary,
            action: ({ })
        )

        DSButtonView(
            label: "Primary Button",
            icon: .check,
            variant: .primary,
            action: ({ })
        )

        DSButtonView(
            label: "Primary Button",
            icon: .check,
            variant: .primary,
            isDisabled: true,
            action: ({ })
        )

        DSButtonView(
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

        DSButtonView(
            label: "Secondary Button",
            variant: .secondary,
            action: ({ })
        )

        DSButtonView(
            label: "Secondary Button",
            icon: .check,
            variant: .secondary,
            action: ({ })
        )

        DSButtonView(
            label: "Secondary Button",
            icon: .check,
            variant: .secondary,
            isDisabled: true,
            action: ({ })
        )

        DSButtonView(
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
        DSButtonView(
            label: "Accent Button",
            variant: .accent,
            action: ({ })
        )

        DSButtonView(
            label: "Accent Button",
            icon: .check,
            variant: .accent,
            action: ({ })
        )

        DSButtonView(
            label: "Accent Button",
            icon: .check,
            variant: .accent,
            isDisabled: true,
            action: ({ })
        )

        DSButtonView(
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

        DSButtonView(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            action: ({ })
        )

        DSButtonView(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            action: (({ }))
        )

        DSButtonView(
            label: "Destructive Button",
            icon: .trash,
            variant: .destructive,
            isDisabled: true,
            action: ({ })
        )

        DSButtonView(
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

        DSButtonView(
            label: "Text Button",
            variant: .textual,
            action: ({ })
        )

        DSButtonView(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            action: ({ })
        )

        DSButtonView(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            isDisabled: true,
            action: ({ })
        )

        DSButtonView(
            label: "Text Button",
            icon: .check,
            variant: .textual,
            isLoading: true,
            action: ({ })
        )
    }

}
