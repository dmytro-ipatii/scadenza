//
//  DSFieldAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import SwiftUI

public struct DSFieldAppearance {

    // Spaces
    let height: CGFloat = DSFieldSize.medium
    let horizontalPaddings: CGFloat = DSSpace.sm

    // Background
    let background: Color = DSSurfaceColors.field
    let borderRadius: CGFloat = DSRadius.md
    let borderWidth: CGFloat = DSBorderWidth.medium
    let borderColor: Color

    let opacity: CGFloat

    public init(from state: DSFieldState) {
        self.borderColor = Self.getBorderColor(for: state)
        self.opacity = state.isDisabled.opacityValue
    }

    private static func getBorderColor(for state: DSFieldState) -> Color {
        switch state {
        case .focused: DSColor.accent
        case .error: DSColor.danger
        default:
                .clear
        }
    }

}
