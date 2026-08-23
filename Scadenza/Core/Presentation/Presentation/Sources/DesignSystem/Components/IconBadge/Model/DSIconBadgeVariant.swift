//
//  DSIconBadgeVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public enum DSIconBadgeVariant: Sendable {
    case succes
    case warning
    case danger(icon: ImageResource)
    case neutral(icon: ImageResource)
    case solid(icon: ImageResource)
    case other(appearance: DSIconBadgeAppearance)

    var appearance: DSIconBadgeAppearance {
        switch self {
        case .succes:
            DSIconBadgeAppearance(
                icon: .check,
                iconColor: DSColor.success,
                background: DSColor.accentTint
            )
        case .warning:
            DSIconBadgeAppearance(
                icon: .exclamation,
                iconColor: DSColor.warning,
                background: DSColor.warningTit
            )
        case .danger(icon: let icon):
            DSIconBadgeAppearance(
                icon: icon,
                iconColor: DSColor.danger,
                background: DSColor.dangerTint
            )
        case .neutral(icon: let icon):
            DSIconBadgeAppearance(
                icon: icon
            )
        case .solid(icon: let icon):
            DSIconBadgeAppearance(
                icon: icon,
                iconColor: DSColor.textPrimary
            )
        case .other(let appearance):
            appearance

        }
    }
}
