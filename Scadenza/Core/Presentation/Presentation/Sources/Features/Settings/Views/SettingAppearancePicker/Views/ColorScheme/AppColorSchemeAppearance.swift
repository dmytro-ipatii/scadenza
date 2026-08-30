//
//  AppColorSchemeAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct AppColorSchemeAppearance {
    let background: Color
    let contentColorHighlight: Color
    let contentColorPrimary: Color
    let contentColorSecondary: Color

    public init(
        background: Color = DSColor.background,
        contentColorHighlight: Color = DSColor.backgroundInverce,
        contentColorPrimary: Color = DSColor.surfaceElevation,
        contentColorSecondary: Color = DSColor.surfaceSecondary
    ) {
        self.background = background
        self.contentColorHighlight = contentColorHighlight
        self.contentColorPrimary = contentColorPrimary
        self.contentColorSecondary = contentColorSecondary
    }

}
