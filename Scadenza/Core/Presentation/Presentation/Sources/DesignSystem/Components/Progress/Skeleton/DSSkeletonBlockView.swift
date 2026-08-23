//
//  DSSkeletonBlockView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSSkeletonBlockView: View {
    private let cornerRadius: CGFloat

    public init(
        cornerRadius: CGFloat = DSRadius.md
    ) {
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(DSColor.disabled)
            .shimmering()
    }
}

#Preview {
    HStack {

        DSSkeletonBlockView(cornerRadius: DSRadius.sm)
            .frame(width: 44, height: 44)

        VStack(alignment: .leading) {
            DSSkeletonBlockView(cornerRadius: DSRadius.sm)
                .frame(width: 100, height: 20)

            DSSkeletonBlockView(cornerRadius: DSRadius.sm)
                .frame(height: 20)

            DSSkeletonBlockView(cornerRadius: DSRadius.sm)
                .frame(height: 20)

        }

    }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
}
