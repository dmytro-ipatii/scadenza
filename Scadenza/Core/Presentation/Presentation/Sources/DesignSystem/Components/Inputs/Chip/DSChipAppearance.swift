//
//  DSChipAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

public struct DSChipAppearance {
    let foreground: Color
    let background: Color
    let chipHeight: CGFloat = DSButtonSize.small
    let iconSize: CGSize = CGSize(width: DSIconSize.sm, height: DSIconSize.sm)
    let horizontalPadding: CGFloat = DSSpace.sm
    let borderRadius: CGFloat = DSRadius.lg

    static var dark: Self {
        Self(
            foreground: DSColor.textSecondary,
            background: DSColor.surfaceSecondary
        )
    }

    static var light: Self {
        Self(
            foreground: DSColor.surfacePrimary,
            background: .white
        )
    }
}
