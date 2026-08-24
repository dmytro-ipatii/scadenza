//
//  SettingRowView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

public struct DSListRowWithActionView<TrailingContent: View>: View {

    private let icon: ImageResource?
    private let title: String
    private let subtitle: String?

    private let trialingConent: TrailingContent?

    private var action: () -> Void

    public init(
        icon: ImageResource? = nil,
        title: String,
        subtitle: String? = nil,
        @ViewBuilder trialingConent: () -> TrailingContent = { EmptyView() },
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.subtitle = subtitle

        self.icon = icon

        self.trialingConent = trialingConent()

        self.action = action
    }

    public var body: some View {
        Button(
            action: action,
            label: ({
                HStack(alignment: .center) {

                    if let icon {
                        iconView(icon)
                    }

                    titleWithSubtitleView

                    Spacer()

                    trialingConent
                }
                .padding(.vertical, DSSpace.xs)
                .padding(.horizontal, DSSpace.sm)
                .frame(minHeight: DSButtonSize.large)
        }))
        .buttonStyle(.plain)
    }

    private func iconView(_ icon: ImageResource) -> some View {
        DSIconBadgeView(
            variant: .other(
                appearance: .init(
                    icon: icon,
                    iconColor: DSColor.textPrimary
                )
            ),
            size: .small
        )
        .frame(width: 30)
    }

    private var titleWithSubtitleView: some View {
        VStack(spacing: DSSpace.xxxs) {
            Text(title)
                .fontBody()
                .foregroundStyle(DSColor.textPrimary)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)

            if let subtitle = subtitle {
                Text(subtitle)
                    .fontCaption()
                    .foregroundStyle(DSColor.textSecondary)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

        }

    }
}

#Preview {
    VStack {

        DSListRowWithActionView(
            icon: .moon,
            title: "Appearance"
        )

        DSListRowWithActionView(
            icon: .moon,
            title: "Appearance",
            trialingConent: {
                DSListRowNavigationValueView(value: "Dark")
            }
        )

        DSListRowWithActionView(
            icon: .bell,
            title: "Reminder",
            trialingConent: {
                DSToggleView(isOn: .constant(true))
            }
        )

        DSListRowWithActionView(
            icon: .bell,
            title: "Reminder",
            subtitle: "13 mag · 09:00",
            trialingConent: {
                DSToggleView(isOn: .constant(true))
            }
        )

    }
    .frame(maxWidth: .infinity)
    .dsListBackgroud(color: DSColor.surfacePrimary)

}
