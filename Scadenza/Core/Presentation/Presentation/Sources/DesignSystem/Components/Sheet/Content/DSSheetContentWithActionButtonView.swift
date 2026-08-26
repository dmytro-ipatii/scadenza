//
//  DSSheetContentWithActionButtonView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 26/08/2026.
//

import SwiftUI

public struct DSSheetContentWithActionButtonView<Content: View>: View {
    private let title: String?
    private let actionLabel: String
    private let detennts: Set<PresentationDetent>
    private let action: () -> Void
    private let content: Content

    public init(
        title: String?,
        detennts: Set<PresentationDetent> = [.large],
        actionLabel: String = "Apply",
        action: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.actionLabel = actionLabel
        self.detennts = detennts
        self.action = action
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: DSSpace.md) {
            if let title {
                titleView(title)
            }

            content

            applyButtonView
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .presentationDetents(detennts)
    }

    private func titleView(_ title: String) -> some View {
        Text(title)
            .foregroundStyle(DSColor.textPrimary)
            .fontTitle()
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var applyButtonView: some View {
        DSButtonView(
            label: actionLabel,
            variant: .primary,
            action: (action)
        )
    }
}

#Preview {
    DSSheetContentWithActionButtonView(
        title: "Select an option",
        action: {},
        content: {
            List(0..<10) { index in
                Text("Option \(index + 1)")
            }
        }
    )
    .padding()
}
