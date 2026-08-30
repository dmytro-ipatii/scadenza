//
//  ColorSchemeOptionView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct ColorSchemeOptionView: View {

    private let colorScheme: AppColorScheme
    private let isSelected: Bool
    private let onPress: (AppColorScheme) -> Void

    private var appearance: OptionColorSchemeOptionAppearance {
        isSelected ? .selected : .idle
    }

    public init(
        colorScheme: AppColorScheme,
        isSelected: Bool,
        onPress: @escaping (AppColorScheme) -> Void
    ) {
        self.colorScheme = colorScheme
        self.isSelected = isSelected
        self.onPress = onPress
    }

    public var body: some View {
        VStack(spacing: DSSpace.sm) {

            colorSchemeView

            colorSchemeFooterView

        }
        .frame(maxWidth: .infinity)

    }

    private var colorSchemeView: some View {
        AppColorSchemeView(
            scheme: colorScheme,
            action: onPress
        )
        .dsBorder(color: appearance.schemeBorderColor, radius: DSRadius.md)
    }

    private var colorSchemeFooterView: some View {
        HStack {
            DSCheckMarkView(state: appearance.checkmarkState)
                .dsBorder(color: appearance.checkmarkBorderColor, radius: DSRadius.full)

            Text(colorScheme.title)
                .fontSecondary()
                .fontWeight(.semibold)
                .foregroundStyle(appearance.foreground)
        }

    }
}

#Preview("Dark scheme") {
    HStack(spacing: 20) {
        ColorSchemeOptionView(
            colorScheme: .dark,
            isSelected: false,
            onPress: ({ _ in })
        )

        ColorSchemeOptionView(
            colorScheme: .dark,
            isSelected: true,
            onPress: ({ _ in })
        )
    }
}

#Preview("Light scheme") {
    HStack(spacing: 20) {
        ColorSchemeOptionView(
            colorScheme: .light,
            isSelected: false,
            onPress: ({ _ in })
        )

        ColorSchemeOptionView(
            colorScheme: .light,
            isSelected: true,
            onPress: ({ _ in })
        )
    }
}
