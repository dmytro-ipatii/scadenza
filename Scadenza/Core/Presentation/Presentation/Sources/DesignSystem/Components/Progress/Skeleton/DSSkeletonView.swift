//
//  DSSkeletonView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSSkeletonView<Content: View>: View {

    private let isLoading: Bool
    private let content: Content

    init(
        isLoading: Bool,
        @ViewBuilder content: () -> Content
    ) {
        self.isLoading = isLoading
        self.content = content()
    }

    public var body: some View {
        content
            .redacted(reason: isLoading ? .placeholder : [])
            .shimmering(active: isLoading)
            .disabled(true)
    }
}

#Preview {
    VStack {

        DSSkeletonView(
            isLoading: true,
            content: {
                DSSourceCardView(
                    title: "Inserimento manuale",
                    subtitle: "Inquadra il foglio: i campi vengono letti in automatico.",
                    variant: .neutral
                )
            }
        )

        DSSkeletonView(
            isLoading: false,
            content: {
                DSSourceCardView(
                    title: "Inserimento manuale",
                    subtitle: "Inquadra il foglio: i campi vengono letti in automatico.",
                    variant: .neutral
                )
            }
        )

    }
    .padding()
}
