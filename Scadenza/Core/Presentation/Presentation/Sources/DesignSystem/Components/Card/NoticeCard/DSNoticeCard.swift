//
//  DSNoticeCard.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public struct DSNoticeCard: View {
    let title: String?
    let content: String
    let variant: DSNoticeCardVariant

    private var appearance: DSNoticeCardAppearance {
        variant.appearance
    }

    public init(
        title: String? = nil,
        content: String,
        variant: DSNoticeCardVariant
    ) {
        self.title = title
        self.content = content
        self.variant = variant
    }

    public var body: some View {
        HStack(alignment: .top) {

            iconView

            VStack {
                if let title {
                    titleView(title)
                }

                contentView(content)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(DSSpace.md)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.lg)
                .fill(appearance.background)
        )

    }

    private var iconView: some View {
        Image(appearance.icon)
            .squareAspectRation()
            .frame(width: DSIconSize.md)
            .foregroundStyle(appearance.foreground)
    }

    private func titleView(_ title: String) -> some View {
        Text(title)
            .fontSecondary()
            .fontWeight(.bold)
            .foregroundStyle(appearance.foreground)
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func contentView(_ content: String) -> some View {
        Text(content)
            .fontCaption()
            .multilineTextAlignment(.leading)
            .foregroundStyle(appearance.foreground)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview("Neutral") {
    VStack {
        DSNoticeCard(
            title: "Access to calendar regected",
            content: "The analysis is done with Apple Intelligence on the device. No files leave the iPhone, not even temporarily.",
            variant: .neutral(icon: .lock)
        )

        DSNoticeCard(
            content: "The analysis is done with Apple Intelligence on the device. No files leave the iPhone, not even temporarily.",
            variant: .neutral(icon: .lock)
        )

    }
    .padding()
}

#Preview("Warning") {
    DSNoticeCard(
        title: "Access to calendar regected",
        content: "The analysis is done with Apple Intelligence on the device. No files leave the iPhone, not even temporarily.",
        variant: .warning
    )
    .padding()
}

#Preview("Danger") {
    DSNoticeCard(
        title: "Delete document?",
        content: "«RC Auto · Fiat Panda» and its attachment will be removed from this iPhone.",
        variant: .danger(icon: .trash)
    )
    .padding()
}

#Preview("Custom") {
    DSNoticeCard(
        title: "Access to calendar regected",
        content: "The analysis is done with Apple Intelligence on the device. No files leave the iPhone, not even temporarily.",
        variant: .custom(icon: .info, foreground: DSColor.accent, background: DSColor.accentTint)
    )
    .padding()
}
