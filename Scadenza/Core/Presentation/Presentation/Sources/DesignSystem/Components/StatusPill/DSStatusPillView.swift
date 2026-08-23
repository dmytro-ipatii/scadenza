//
//  DSStatusPillView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public struct DSStatusPillView: View {
    private let text: String
    private let status: DSStatusPillVariant

    public init(
        text: String,
        status: DSStatusPillVariant
    ) {
        self.text = text
        self.status = status
    }

    public var body: some View {
        HStack {
            Circle()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 8)

            Text(text)
                .fontCaption()
                .fontWeight(.bold)

        }
        .foregroundStyle(status.foreground)
        .padding(.horizontal, DSSpace.sm)
        .frame(height: 27)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.full)
                .fill(status.background)
        )
    }
}

#Preview {
    VStack {
        DSStatusPillView(
            text: "Valid",
            status: .valid
        )

        DSStatusPillView(
            text: "Expiring",
            status: .expiring
        )

        DSStatusPillView(
            text: "Expired",
            status: .expired
        )

        DSStatusPillView(
            text: "Archived",
            status: .archived
        )
    }
    .padding()
}
