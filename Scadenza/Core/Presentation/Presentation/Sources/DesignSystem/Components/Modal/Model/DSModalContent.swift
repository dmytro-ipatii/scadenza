//
//  DSAlertContent.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 23/08/2026.
//

import SwiftUI

public struct DSModalButton: Sendable, Identifiable {
    let label: String
    let variant: DSButtonVariant
    let action: @MainActor () -> Void

    public var id: String {
        "\(label)_\(variant.hashValue)"
    }
}

public struct DSModalContent: Sendable, Equatable {

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.title != rhs.title
        && lhs.variant != rhs.variant
        && lhs.icon != rhs.icon
        && lhs.message != rhs.message
    }

    let icon: ImageResource?
    let title: String
    let variant: DSModalVariant
    let message: String?
    let buttons: [DSModalButton]

    init(
        icon: ImageResource? = nil,
        title: String,
        variant: DSModalVariant,
        message: String? = nil,
        buttons: [DSModalButton] = []
    ) {
        self.icon = icon
        self.title = title
        self.variant = variant
        self.message = message
        self.buttons = buttons
    }

    var iconBadge: DSIconBadgeVariant? {

        guard let icon else { return nil }

        switch variant {
        case .neutral:
            return DSIconBadgeVariant.neutral(icon: icon)
        case .warning:
            return DSIconBadgeVariant.warning
        case .danger:
            return DSIconBadgeVariant.danger(icon: icon)
        }
    }
}
