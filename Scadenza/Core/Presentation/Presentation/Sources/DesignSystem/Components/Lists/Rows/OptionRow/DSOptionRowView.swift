//
//  DSOptionRowView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSOptionRowView<Content: View>: View {
    let leadingIconConfigs: DSOptionIconConfigs?
    let trailingIconConfigs: DSOptionIconConfigs?
    let content: () -> Content

    public init(
        leadingIconConfigs: DSOptionIconConfigs? = nil,
        trailingIconConfigs: DSOptionIconConfigs? = nil,
        content: @escaping () -> Content
    ) {
        self.leadingIconConfigs = leadingIconConfigs
        self.trailingIconConfigs = trailingIconConfigs
        self.content = content
    }

    public var body: some View {
        HStack {
            if let leadingIconConfigs {
                leadingIconView(leadingIconConfigs)
            }

            content()
                .frame(maxWidth: .infinity, alignment: .leading)

            if let trailingIconConfigs {
                trailingIconView(trailingIconConfigs)
            }
        }
        .padding(.horizontal, DSSpace.sm)
        .frame(maxWidth: .infinity, minHeight: 48)
    }

    @ViewBuilder
    private func leadingIconView(_ configs: DSOptionIconConfigs) -> some View {
        Image(configs.icon)
            .optionRowIcon(color: configs.color)

        Spacer()
    }

    @ViewBuilder
    private func trailingIconView(_ configs: DSOptionIconConfigs) -> some View {
        Spacer()

        Image(configs.icon)
            .optionRowIcon(color: configs.color)
    }
}

#Preview("Plain text") {
    DSOptionRowView {
        Text("Assicurazione auto")
            .foregroundStyle(DSColor.textPrimary)
            .fontBody()
            .fontWeight(.medium)
    }
}

#Preview("With Icons") {
    VStack(spacing: 20) {
        DSOptionRowView(
            leadingIconConfigs: .init(icon: .clock)
        ) {
            Text("Assicurazione auto")
                .foregroundStyle(DSColor.textPrimary)
                .fontBody()
                .fontWeight(.medium)
        }

        DSOptionRowView(
            leadingIconConfigs: .init(icon: .clock),
            trailingIconConfigs: .init(icon: .arrowUpRight)
        ) {
            Text("Assicurazione auto")
                .foregroundStyle(DSColor.textPrimary)
                .fontBody()
                .fontWeight(.medium)
        }

        DSOptionRowView(
            leadingIconConfigs: .init(icon: .sparkles, color: DSColor.accent )
        ) {
            Text("Assicurazione auto")
                .foregroundStyle(DSColor.textPrimary)
                .fontBody()
                .fontWeight(.medium)
        }

        DSOptionRowView(
            trailingIconConfigs: .init(icon: .check, color: DSColor.accent )
        ) {
            Text("Assicurazione auto")
                .foregroundStyle(DSColor.textPrimary)
                .fontBody()
                .fontWeight(.medium)
        }
    }
}
