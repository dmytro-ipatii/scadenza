//
//  DSNoticeCardVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public enum DSNoticeCardVariant {
    case warning
    case danger(icon: ImageResource)
    case neutral(icon: ImageResource)
    case custom(icon: ImageResource, foreground: Color, background: Color)

    public var appearance: DSNoticeCardAppearance {
        switch self {
        case .warning: return DSNoticeCardAppearance.warning
        case .danger(icon: let icon): return DSNoticeCardAppearance.getDanger(icon: icon)
        case .neutral(icon: let icon): return DSNoticeCardAppearance.getNeutral(icon: icon)
        case .custom(
            icon: let icon,
            foreground: let foreground,
            background: let background
        ): return DSNoticeCardAppearance(
            icon: icon,
            foreground: foreground,
            background: background
        )
        }
    }
}
