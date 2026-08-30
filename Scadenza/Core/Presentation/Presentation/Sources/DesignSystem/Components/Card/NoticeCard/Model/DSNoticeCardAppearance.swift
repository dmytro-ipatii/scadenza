//
//  DSNoticeCardAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public struct DSNoticeCardAppearance {
    let icon: ImageResource
    let iconColor: Color
    let foreground: Color
    let background: Color

    public init(
        icon: ImageResource,
        iconColor: Color? = nil,
        foreground: Color,
        background: Color
    ) {
        self.icon = icon
        self.iconColor = iconColor ?? foreground
        self.foreground = foreground
        self.background = background
    }

    public static func getNeutral(icon: ImageResource) -> Self {
        .init(
            icon: icon,
            foreground: DSColor.textSecondary,
            background: DSColor.surfacePrimary
        )
    }

    public static var warning: Self {
        .init(
            icon: .exclamation,
            foreground: DSColor.warning,
            background: DSColor.warningTit
        )
    }

    public static func getDanger(icon: ImageResource) -> Self {
        .init(
            icon: icon,
            foreground: DSColor.danger,
            background: DSColor.dangerTint
        )
    }
}
