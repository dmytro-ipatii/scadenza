//
//  DSSourceCardView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public struct DSSourceCardView: View {

    private let title: String
    private let label: String?
    private let subtitle: String

    private let icon: ImageResource = .scan
    private let variant: DSSourceCardVariant

    private var appearance: DSSourceCardAppearance = .init()

    public init(
        title: String,
        label: String? = nil,
        subtitle: String,
        variant: DSSourceCardVariant
    ) {
        self.title = title
        self.label = label
        self.subtitle = subtitle
        self.variant = variant
    }

    public var body: some View {
        HStack(alignment: .center, spacing: DSSpace.sm) {

            iconView

            VStack(spacing: DSSpace.xxxs) {
                Group {

                    if let label {
                        labelView(label)
                    }

                    titleView(title)

                    subtitleView(subtitle)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(DSSpace.md)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(minHeight: 90)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.lg)
                .fill(appearance.background)
        )
        .overlay {
            RoundedRectangle(cornerRadius: DSRadius.lg)
                .stroke(
                    variant.higlightColor,
                    style: StrokeStyle(lineWidth: 2)
                )
                .opacity(variant.higlightOpacity)
        }
    }

    private var iconView: some View {
        DSIconBadgeView(
            variant: .other(
                appearance: .init(
                    icon: icon,
                    iconColor: appearance.foreground,
                    background: appearance.iconBadgeBackground
                )
            )
        )
        .frame(width: 48, height: 48)
    }

    private func labelView(_ label: String) -> some View {
        Text(label.uppercased())
            .fontCaption()
            .foregroundStyle(appearance.hightlightColor)
            .fontWeight(.bold)
    }

    private func titleView(_ title: String) -> some View {
        Text(title)
            .fontBody()
            .foregroundStyle(appearance.foreground)
    }

    private func subtitleView(_ subtitle: String) -> some View {
        Text(subtitle)
            .fontCaption()
            .foregroundStyle(DSColor.textTertiary)
    }
}

#Preview {
    VStack {

        DSSourceCardView(
            title: "Inserimento manuale",
            subtitle: "Inquadra il foglio: i campi vengono letti in automatico.",
            variant: .neutral
        )

        DSSourceCardView(
            title: "Inserimento manuale",
            label: "New",
            subtitle: "Inquadra il foglio: i campi vengono letti in automatico.",
            variant: .neutral
        )

        DSSourceCardView(
            title: "Inserimento manuale",
            label: "New",
            subtitle: "Inquadra il foglio: i campi vengono letti in automatico.",
            variant: .selected
        )

    }
    .padding()
}
