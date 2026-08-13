//
//  DSButtonAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

public struct DSButtonAppearance {
    let foregroud: Color
    let background: Color
    let usesGlassEffect: Bool
    let cornerRadius: CGFloat
    let horizontalPadding: CGFloat
    let buttonHeight: CGFloat
    let iconSize: CGSize

    public init(from variant: DSButtonVariant) {
        self.usesGlassEffect = variant != .textual
        self.cornerRadius = DSRadius.xl
        self.horizontalPadding = DSSpace.lg
        self.buttonHeight = DSButtonSize.large
        self.iconSize = CGSize(width: DSIconSize.md, height: DSIconSize.md)
        self.foregroud = Self.foreground(for: variant)
        self.background = Self.background(for: variant)
    }

    static private func foreground(for variant: DSButtonVariant) -> Color {
        switch variant {
        case .accent, .primary: DSColor.textInverse
        case .secondary: DSColor.textPrimary
        case .textual: DSColor.textPrimary
        case .destructive: DSColor.danger
        }
    }

    static private func background(for variant: DSButtonVariant) -> Color {
        switch variant {
        case .accent: DSColor.accent
        case .primary: DSColor.surfaceInverse
        case .textual: Color.clear
        case .secondary: DSColor.surfaceSecondary
        case .destructive: DSColor.dangerTint
        }
    }
}
