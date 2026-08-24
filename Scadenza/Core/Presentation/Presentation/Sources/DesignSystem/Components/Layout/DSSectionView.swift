//
//  DSSectionView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

public struct DSSectionView<Content: View>: View {

    private let title: String
    private let content: Content

    public init(
        title: String,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.title = title
        self.content = content()
    }

    public var body: some View {
        Section(
            content: {
                content
                    .frame(maxWidth: .infinity)
            },
            header: {
                Text(title.uppercased())
                    .fontCaption()
                    .fontWeight(.bold)
                    .foregroundStyle(DSColor.textTertiary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            })
    }
}

#Preview {
    DSSectionView(title: "General") {
        DSScreenView {
            Text("Hello World!")
        }
    }
}
