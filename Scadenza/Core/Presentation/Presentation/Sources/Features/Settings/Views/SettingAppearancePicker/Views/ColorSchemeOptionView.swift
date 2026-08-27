//
//  ColorSchemeOptionView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct ColorSchemeOptionView: View {
    private let scheme: AppColorScheme
    private let state: AppearanceOptionVariant
    private let action: (AppColorScheme) -> Void

    private var appearance: AppearanceOptionAppearance {
        state.appearance
    }

    init(
        scheme: AppColorScheme,
        state: AppearanceOptionVariant,
        action: @escaping (AppColorScheme) -> Void
    ) {
        self.scheme = scheme
        self.state = state
        self.action = action
    }
    public var body: some View {
        VStack(alignment: .leading) {

            contentView(background: appearance.contentColorHighlight)
                .frame(width: 50, height: 8)

            contentView(background: appearance.contentColorPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 28)

            contentView(background: appearance.contentColorPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 28)

            contentView(background: appearance.contentColorSecondary)
                .frame(maxWidth: .infinity)
                .frame(height: 16)

        }
        .padding(DSSpace.xs)
        .frame(minHeight: 128)
        .frame(width: 100, alignment: .topLeading)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.md)
                .fill(appearance.background)
        )
        .overlay {
            RoundedRectangle(cornerRadius: DSRadius.md)
                .stroke(appearance.highlightColor, style: StrokeStyle(lineWidth: 2))
        }
        .colorScheme(scheme.colorScheme)
        .onTapGesture(perform: {
            action(scheme)
        })

    }

    private func contentView(
        background: Color
    ) -> some View {
        RoundedRectangle(cornerRadius: DSRadius.xxs)
            .fill(background)
    }
}

#Preview {
    HStack {

        VStack {
            Text("Light")
            ColorSchemeOptionView(
                scheme: .light,
                state: .idle,
                action: ({_ in})
            )

            DSCheckMarkView(state: .completed)
        }

        VStack {
            Text("Dark")
            ColorSchemeOptionView(
                scheme: .dark,
                state: .idle,
                action: ({_ in})
            )

            DSCheckMarkView(state: .empty)
        }

        VStack {
            Text("Dark")
            ColorSchemeOptionView(
                scheme: .dark,
                state: .selected,
                action: ({_ in})
            )

            DSCheckMarkView(state: .empty)
        }

    }
}
