//
//  DSSliderView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 16/08/2026.
//

import SwiftUI

struct DSSliderView: View {

    @Binding var value: Float
    private let label: String
    private let rangeValueLables: DSSliderMinMaxLabel?
    private let onEditingChanged: (Bool) -> Void

    init(
        value: Binding<Float>,
        label: String = "",
        rangeValueLables: DSSliderMinMaxLabel? = nil,
        onEditingChanged: @escaping (Bool) -> Void = { _ in }
    ) {
        self._value = value
        self.label = label
        self.rangeValueLables = rangeValueLables
        self.onEditingChanged = onEditingChanged
    }

    var body: some View {
        DSFieldView(
            label: label,
            content: ({
                Slider(
                    value: $value,
                    label: {},
                    minimumValueLabel: {
                        if let min = rangeValueLables?.min {
                            rangeLabelView(min)
                        }
                    },
                    maximumValueLabel: {
                        if let max = rangeValueLables?.max {
                            rangeLabelView(max)
                        }
                    },
                    onEditingChanged: onEditingChanged
                )
            })
        )

    }

    private func rangeLabelView(_ label: String) -> some View {
        Text(label)
            .fontSecondary()
            .foregroundStyle(DSColor.textPrimary)
    }
}

#Preview {
    DSSliderView(
        value: .constant(
            0.10
        ),
        label: "Slider",
        rangeValueLables: .init(min: "Min", max: "Max")
    )
}
