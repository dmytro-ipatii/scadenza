//
//  DSBadgeView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI


public enum DSIconBangeSize {
    case small
    case medium

    var cornerRadius: CGFloat {
        switch self {
        case .small:
            DSRadius.xs
        case .medium:
            DSRadius.md
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .small:
            DSIconSize.sm
        case .medium:
            DSIconSize.xl
        }
    }
}

public struct DSIconBadgeView: View {
    var variant: DSIconBadgeVariant
    var size: DSIconBangeSize

    private var appearance: DSIconBadgeAppearance {
        variant.appearance
    }

    public init(
        variant: DSIconBadgeVariant,
        size: DSIconBangeSize = .medium
    ) {
        self.variant = variant
        self.size = size
    }

    public var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: size.cornerRadius)
                .fill(appearance.background)

            Image(appearance.icon)
                .squareAspectRation()
                .frame(width: size.iconSize)
                .foregroundStyle(appearance.iconColor)
        }
        .aspectRatio(1, contentMode: .fit)

    }
}

#Preview("Overview") {
    Group {
        DSIconBadgeView(
            variant: .succes
        )

        DSIconBadgeView(
            variant: .warning
        )

        DSIconBadgeView(
            variant: .danger(icon: .exclamation)
        )

        DSIconBadgeView(
            variant: .neutral(icon: .folder)
        )

        DSIconBadgeView(
            variant: .solid(icon: .faceid)
        )

        DSIconBadgeView(
            variant: .other(
                appearance: .init(
                    icon: .calendar
                )
            )
        )

    }
    .frame(width: 56, height: 56)
    .padding()
}

#Preview("Sizes") {
    Group {
        DSIconBadgeView(
            variant: .succes
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .succes,
            size: .small
        )
        .frame(width: 32)
    }

    .padding()
}
