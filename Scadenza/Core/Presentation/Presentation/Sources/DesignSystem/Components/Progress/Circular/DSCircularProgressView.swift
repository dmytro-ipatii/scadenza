//
//  DSCircularProgressView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSCircularProgressView: View {
    @Binding var value: CGFloat
    private var label: String
    private var color: Color
    private var size: DSCircularProgressSize

    public init(
        value: Binding<CGFloat>,
        label: String = "",
        color: Color = DSColor.accent,
        size: DSCircularProgressSize = .medium
    ) {
        self._value = value
        self.label = label
        self.color = color
        self.size = size
    }

    public var body: some View {
        ProgressView(
            label,
            value: value
        )
        .progressViewStyle(DSCircularProgressStyle(color: color))
        .frame(width: size.value)
    }
}

#Preview {
    VStack {

        DSCircularProgressView(
            value: .constant(1.0),
            label: "100%"
        )

        DSCircularProgressView(
            value: .constant(0.4),
            label: "40%"
        )

        DSCircularProgressView(
            value: .constant(0.3),
            label: "30%",
            color: DSColor.warning,
            size: .small
        )

        DSCircularProgressView(
            value: .constant(0.2),
            label: "20%",
            color: DSColor.danger,
            size: .small
        )

        DSCircularProgressView(
            value: .constant(1.2),
            label: "120%",
            size: .custom(size: 120)
        )

    }
}
