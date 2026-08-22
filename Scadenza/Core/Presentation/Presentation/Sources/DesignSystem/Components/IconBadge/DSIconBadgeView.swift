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

            Image(appearance.icon)
                .squareAspectRation()
                .frame(width: DSIconSize.xl)
                .foregroundStyle(appearance.iconColor)
        }
        .aspectRatio(1, contentMode: .fit)

    }
}

#Preview {
    VStack {
        DSIconBadgeView(
            variant: .succes
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .warning
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .danger
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .neutral(icon: .folder)
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .solid(icon: .faceid)
        )
        .frame(width: 56, height: 56)

        DSIconBadgeView(
            variant: .other(
                appearance: .init(
                    icon: .calendar
                )
            )
        )
        .frame(width: 56, height: 56)

    }
    .padding()
}
