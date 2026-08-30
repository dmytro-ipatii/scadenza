//
//  OptionColorSchemeOptionAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct OptionColorSchemeOptionAppearance {
    let schemeBorderColor: Color
    let checkmarkState: DSCheckmarkVariant
    let checkmarkBorderColor: Color
    let foreground: Color

    public init(
        schemeBorderColor: Color = DSColor.surfaceElevation,
        checkmarkState: DSCheckmarkVariant = .empty,
        checkmarkBorderColor: Color = Color.clear,
        foreground: Color = DSColor.textTertiary,
    ) {
        self.schemeBorderColor = schemeBorderColor
        self.checkmarkState = checkmarkState
        self.checkmarkBorderColor = checkmarkBorderColor
        self.foreground = foreground
    }

    static var idle: Self {
        Self()
    }

    static var selected: Self {
        Self(
            schemeBorderColor: DSColor.success,
            checkmarkState: .completed,
            checkmarkBorderColor: DSColor.success,
            foreground: DSColor.textPrimary
        )
    }
}
