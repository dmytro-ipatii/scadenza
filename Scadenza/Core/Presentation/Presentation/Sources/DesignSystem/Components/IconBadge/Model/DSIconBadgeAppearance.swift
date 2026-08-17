//
//  DSIconBadgeAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public struct DSIconBadgeAppearance: Sendable {
    let icon: ImageResource
    let iconColor: Color
    let background: Color

    public init(
        icon: ImageResource,
        iconColor: Color = DSColor.textTertiary,
        background: Color = DSColor.surfacePrimary
    ) {
        self.icon = icon
        self.iconColor = iconColor
        self.background = background
    }

}
