//
//  DSLinearProgressView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSLinearProgressView: View {

    @Binding var value: CGFloat
    var total: CGFloat
    var color: Color
    var height: CGFloat

    public init(
        value: Binding<CGFloat>,
        total: CGFloat = 1.0,
        color: Color = DSColor.surfaceInverse,
        height: CGFloat = 4
    ) {
        self._value = value
        self.total = total
        self.color = color
        self.height = height
    }

    public var body: some View {
        ProgressView(value: value, total: total)
            .progressViewStyle(DSLinearProgressStyle(color: color, height: height))
    }
}

#Preview {
    VStack {

        DSLinearProgressView(
            value: .constant(0.5),
            total: 1.0
        )

        DSLinearProgressView(
            value: .constant(0.5),
            total: 1.0
        )

        DSLinearProgressView(
            value: .constant(0.5),
            total: 1.0,
            color: DSColor.success
        )

        DSLinearProgressView(
            value: .constant(0.5),
            total: 1.0,
            color: DSColor.warning
        )

        DSLinearProgressView(
            value: .constant(0.5),
            total: 1.0,
            color: DSColor.danger
        )
    }
    .padding()
}
