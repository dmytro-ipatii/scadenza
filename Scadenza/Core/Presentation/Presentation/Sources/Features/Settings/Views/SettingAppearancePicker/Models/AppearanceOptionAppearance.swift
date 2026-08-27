//
//  AppearanceOptionAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct AppearanceOptionAppearance {
    let background: Color
    let contentColorHighlight: Color
    let contentColorPrimary: Color
    let contentColorSecondary: Color
    let highlightColor: Color

    public init(
        background: Color = DSColor.background,
        contentColorHighlight: Color = DSColor.backgroundInverce,
        contentColorPrimary: Color = DSColor.surfaceElevation,
        contentColorSecondary: Color = DSColor.surfaceSecondary,
        highlightColor: Color = DSColor.surfaceSecondary,
    ) {
        self.background = background
        self.contentColorHighlight = contentColorHighlight
        self.contentColorPrimary = contentColorPrimary
        self.contentColorSecondary = contentColorSecondary
        self.highlightColor = highlightColor
    }

    static var idle: Self {
        Self()
    }

    static var selected: Self {
        Self(highlightColor: DSColor.success)
    }
}
