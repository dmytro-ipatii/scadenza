//
//  DSPickerContentView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSPickerContentView: View {
    private var value: String
    private let label: String
    private let fieldState: DSFieldState
    private var icon: ImageResource?
    private var onPress: () -> Void

    public init(
        value: String,
        label: String,
        icon: ImageResource? = nil,
        fieldState: DSFieldState,
        onPress: @escaping () -> Void = {}
    ) {
        self.value = value
        self.label = label
        self.icon = icon
        self.fieldState = fieldState
        self.onPress = onPress
    }

    public var body: some View {
        DSFieldView(
            label: label,
            state: fieldState,
            content: ({
                HStack {

                    if let icon {
                        trailingIconView(icon)
                    }

                    contentView(value)

                    Spacer()

                    chevronIconView
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .contentShape(.rect)
                .onTapGesture(perform: onPress)
            })
        )

    }

    private func trailingIconView(_ icon: ImageResource) -> some View {
        Image(icon)
            .inputIcon()
    }

    private func contentView(_ text: String) -> some View {
        Text(text)
            .fontBody()
            .fontWeight(.medium)
            .foregroundStyle(DSColor.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var chevronIconView: some View {
        Image(.chevronDown)
            .inputIcon()
    }
}

#Preview("Preview") {
    VStack(spacing: 20) {
        DSPickerContentView(
            value: "Assicurazioni",
            label: "Categoria",
            icon: .umbrella,
            fieldState: .idle,
            onPress: ({})
        )

        DSPickerContentView(
            value: "Assicurazioni",
            label: "Categoria",
            fieldState: .idle,
            onPress: ({})
        )

        DSPickerContentView(
            value: "Assicurazioni",
            label: "Categoria",
            fieldState: .idle,
            onPress: ({})
        )

    }
    .padding()
}

#Preview("Disabled") {
    DSPickerContentView(
        value: "Assicurazioni",
        label: "Categoria",
        icon: .umbrella,
        fieldState: .disabled,
        onPress: ({})
    )
    .padding()
}

#Preview("Error") {
    DSPickerContentView(
        value: "Assicurazioni",
        label: "Categoria",
        icon: .umbrella,
        fieldState: .error(message: "Select a category"),
        onPress: ({})
    )
    .padding()
}
