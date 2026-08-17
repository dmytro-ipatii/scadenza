//
//  DSBadgeView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public struct DSIconBadgeView: View {
    var variant: DSIconBadgeVariant

    private var appearance: DSIconBadgeAppearance {
        variant.appearance
    }

    public init(variant: DSIconBadgeVariant) {
        self.variant = variant
    }

    public var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: DSRadius.md)
                .fill(appearance.background)
                .frame(width: 56, height: 56)

            Image(appearance.icon)
                .squareAspectRation()
                .frame(width: DSIconSize.xl)
                .foregroundStyle(appearance.iconColor)
        }
    }
}

#Preview {
    VStack {
        DSIconBadgeView(
            variant: .succes
        )

        DSIconBadgeView(
            variant: .warning
        )

        DSIconBadgeView(
            variant: .danger
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
    .padding()
}
