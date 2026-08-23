//
//  DSSourceCardAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public struct DSSourceCardAppearance: Sendable {
    let foreground: Color
    let background: Color
    let iconBadgeBackground: Color
    let hightlightColor: Color

    public init(
        foreground: Color = DSColor.textPrimary,
        background: Color = DSColor.surfaceSecondary,
        iconBadgeBackground: Color = DSColor.surfaceElevation,
        hightlightColor: Color = DSColor.success
    ) {
        self.foreground = foreground
        self.background = background
        self.iconBadgeBackground = iconBadgeBackground
        self.hightlightColor = hightlightColor
    }

}
