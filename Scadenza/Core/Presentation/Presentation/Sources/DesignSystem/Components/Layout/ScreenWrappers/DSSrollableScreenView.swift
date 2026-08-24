//
//  DSSrollableScreenView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

public struct DSSrollableScreenView<Content: View>: View {
    private var content: Content

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
    }

    public var body: some View {
        ScrollView {
            content
                .dsScreenContentLayout()
        }
        .scrollIndicators(.hidden)
        .dsScreenBackground()

    }
}
