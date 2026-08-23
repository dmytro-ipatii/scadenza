//
//  DSLinearProgressStyle.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSLinearProgressStyle: ProgressViewStyle {
    private var color: Color
    private var cornerRadius: CGFloat
    private var height: CGFloat

    public init(
        color: Color = DSColor.surfaceInverse,
        cornerRadius: CGFloat = DSRadius.full,
        height: CGFloat = 4
    ) {
        self.color = color
        self.height = height
        self.cornerRadius = cornerRadius
    }

    public func makeBody(configuration: Configuration) -> some View {

        let value = configuration.fractionCompleted ?? 0.0

        return GeometryReader { geometry in
            ZStack(alignment: .leading) {

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(DSColor.surfacePrimary)

                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
                    .frame(width: geometry.size.width * CGFloat(value))

            }
        }
        .frame(height: height)

    }
}
