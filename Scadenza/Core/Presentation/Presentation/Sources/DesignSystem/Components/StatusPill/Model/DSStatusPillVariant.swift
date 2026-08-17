//
//  DSStatusPillVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 17/08/2026.
//

import SwiftUI

public enum DSStatusPillVariant {
    case valid
    case expiring
    case expired
    case archived

    var foreground: Color {
        switch self {
        case .valid: DSColor.success
        case .expiring: DSColor.warning
        case .expired: DSColor.danger
        case .archived: DSColor.textTertiary
        }
    }

    var background: Color {
        switch self {
        case .valid: DSColor.successTit
        case .expiring: DSColor.warningTit
        case .expired: DSColor.dangerTint
        case .archived: DSColor.inactive
        }
    }
}
