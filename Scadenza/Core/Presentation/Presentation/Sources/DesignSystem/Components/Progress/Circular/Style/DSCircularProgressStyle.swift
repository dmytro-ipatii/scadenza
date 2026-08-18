//
//  DSCircularProgressStyle.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSCircularProgressStyle: ProgressViewStyle {

    private var color: Color

    public init(color: Color = DSColor.accent) {
        self.color = color
    }

    public func makeBody(configuration: Configuration) -> some View {

        let label = configuration.label
        let fractionCompleted = configuration.fractionCompleted ?? 0.0
        let lineWidth: CGFloat = 8

        return GeometryReader(content: ({ geometry in

            let size = min(geometry.size.width, geometry.size.height)
            let fontSize = size * 0.25

            ZStack {
                Circle()
                    .stroke(DSColor.surfacePrimary, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))

                Circle()
                    .trim(from: 0, to: fractionCompleted)
                    .stroke(color, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))

                label
                    .font(.system(size: fontSize, weight: .bold))
                    .minimumScaleFactor(0.5)

            }
        }))
        .aspectRatio(1, contentMode: .fit)
        .padding(lineWidth / 2)
    }
}
