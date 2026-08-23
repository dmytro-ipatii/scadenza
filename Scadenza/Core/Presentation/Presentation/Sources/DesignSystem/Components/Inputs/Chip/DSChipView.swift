//
//  DSChipView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

struct DSChipView: View {
    private let label: String
    private let count: String?
    private let icon: ImageResource
    private let isActive: Bool
    private let isDisabled: IsDisabled
    private let action: () -> Void

    private var appearance: DSChipAppearance {
        isActive ? .light : .dark
    }

    public init(
        label: String,
        count: String? = nil,
        icon: ImageResource,
        isActive: Bool,
        isDisabled: IsDisabled = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.count = count
        self.icon = icon
        self.isActive = isActive
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button(
            action: action,
            label: ({
                Label(
                    title: {
                        HStack {
                            Text(label)
                                .fontSecondary()
                                .fontWeight(.semibold)

                            if let count {
                                Text(count)
                                    .fontSecondary()
                                    .fontWeight(.semibold)
                            }
                        }
                    },
                    icon: {
                        Image(icon)
                            .resizable()
                            .frame(width: appearance.iconSize.width, height: appearance.iconSize.height)
                    }
                )
                .foregroundStyle(appearance.foreground)

            })
        )
        .frame(height: appearance.chipHeight)
        .padding(.horizontal, appearance.horizontalPadding)
        .background(
            RoundedRectangle(cornerRadius: appearance.borderRadius)
                .foregroundStyle(appearance.background)
        )
        .glassEffect(.regular)
        .disabled(isDisabled)
        .opacity(isDisabled.opacityValue)

    }
}

#Preview("Inactive") {
    DSChipView(
        label: "Expiring",
        count: "6",
        icon: .clock,
        isActive: false,
        action: ({})
    )

    DSChipView(
        label: "Expiring",
        icon: .clock,
        isActive: false,
        action: ({})
    )

    DSChipView(
        label: "Expiring",
        icon: .clock,
        isActive: false,
        isDisabled: true,
        action: ({})
    )
}

#Preview("Active") {
    DSChipView(
        label: "Expiring",
        count: "6",
        icon: .clock,
        isActive: true,
        action: ({})
    )

    DSChipView(
        label: "Expiring",
        icon: .clock,
        isActive: true,
        action: ({})
    )

    DSChipView(
        label: "Expiring",
        icon: .clock,
        isActive: true,
        isDisabled: true,
        action: ({})
    )

}
