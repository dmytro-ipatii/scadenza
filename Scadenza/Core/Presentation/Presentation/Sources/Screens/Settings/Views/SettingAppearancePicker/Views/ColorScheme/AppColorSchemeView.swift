//
//  AppColorSchemeView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct AppColorSchemeView: View {
    private let scheme: AppColorScheme
    private let action: (AppColorScheme) -> Void

    private var appearance: AppColorSchemeAppearance = .init()

    init(
        scheme: AppColorScheme,
        action: @escaping (AppColorScheme) -> Void
    ) {
        self.scheme = scheme
        self.action = action
    }
    public var body: some View {
        VStack(alignment: .leading, spacing: DSSpace.xs) {

            contentView(background: appearance.contentColorHighlight)
                .frame(width: 50, height: 8)

            contentView(background: appearance.contentColorPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 38)

            contentView(background: appearance.contentColorPrimary)
                .frame(maxWidth: .infinity)
                .frame(height: 38)

            contentView(background: appearance.contentColorSecondary)
                .frame(maxWidth: .infinity)
                .frame(height: 26)

        }
        .padding(DSSpace.xs)
        .frame(minHeight: 180, alignment: .topLeading)
        .frame(width: 150)
        .background(
            RoundedRectangle(cornerRadius: DSRadius.md)
                .fill(appearance.background)
        )
        .colorScheme(scheme.colorScheme)
        .onTapGesture {
            action(scheme)
        }

    }

    private func contentView(
        background: Color
    ) -> some View {
        RoundedRectangle(cornerRadius: DSRadius.xxs)
            .fill(background)
    }
}

#Preview {
    HStack(spacing: 20) {

        VStack {
            AppColorSchemeView(
                scheme: .light,
                action: ({_ in})
            )

            HStack {
                DSCheckMarkView(state: .empty)

                Text("Light")
            }

        }

        VStack {

            AppColorSchemeView(
                scheme: .dark,
                action: ({_ in})
            )

            HStack {
                DSCheckMarkView(state: .empty)

                Text("Dark")
            }

        }

    }
}
