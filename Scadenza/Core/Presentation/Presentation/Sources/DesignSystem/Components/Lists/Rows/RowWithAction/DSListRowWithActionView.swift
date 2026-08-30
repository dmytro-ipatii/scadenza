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
    private let primaryColor: Color

    private let trailingContent: TrailingContent?

    private var action: () -> Void

    public init(
        icon: ImageResource? = nil,
        title: String,
        subtitle: String? = nil,
        primaryColor: Color = DSColor.textPrimary,
        @ViewBuilder trialingConent: () -> TrailingContent = { EmptyView() },
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.subtitle = subtitle
        self.primaryColor = primaryColor

        self.icon = icon

        self.trailingContent = trialingConent()

        self.action = action
    }

    public var body: some View {
        HStack(alignment: .center) {

            if let icon {
                iconView(icon)
            }

            titleWithSubtitleView

            Spacer()

            trailingContent
        }
        .padding(.vertical, DSSpace.xs)
        .padding(.horizontal, DSSpace.sm)
        .frame(minHeight: DSButtonSize.large)
        .contentShape(Rectangle())
        .onTapGesture(perform: action)
    }

    private func iconView(_ icon: ImageResource) -> some View {
        DSIconBadgeView(
            variant: .other(
                appearance: .init(
                    icon: icon,
                    iconColor: primaryColor
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
                .foregroundStyle(primaryColor)
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
            trialingConent: ({
                DSListRowNavigationValueView(value: "Dark")
            })
        )

        DSListRowWithActionView(
            icon: .bell,
            title: "Reminder",
            trialingConent: ({
                DSToggleView(isOn: .constant(true))
            })
        )

        DSListRowWithActionView(
            icon: .bell,
            title: "Reminder",
            subtitle: "13 mag · 09:00",
            trialingConent: ({
                DSToggleView(isOn: .constant(true))
            })
        )

        DSListRowWithActionView(
            icon: .trash,
            title: "Delete all data",
            primaryColor: DSColor.danger,
            action: ({})
        )

    }
    .frame(maxWidth: .infinity)
    .dsListBackgroud(color: DSColor.surfacePrimary)

}
