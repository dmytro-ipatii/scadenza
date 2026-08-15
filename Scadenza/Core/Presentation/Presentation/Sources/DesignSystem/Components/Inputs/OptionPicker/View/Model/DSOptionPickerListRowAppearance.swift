//
//  DSPickerListRowAppearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSOptionPickerListRowAppearance: Sendable {
    let icon: DSOptionIconConfigs?
    let foreground: Color
    let fontWeight: Font.Weight

    public init(
        icon: DSOptionIconConfigs? = nil,
        foreground: Color  = DSColor.textSecondary,
        fontWeight: Font.Weight = .medium
    ) {
        self.icon = icon
        self.foreground = foreground
        self.fontWeight = fontWeight
    }

    public static let plain: DSOptionPickerListRowAppearance = .init()
    public static let selected: DSOptionPickerListRowAppearance = .init(
        icon: .init(icon: .check, color: DSColor.success),
        foreground: DSColor.textPrimary,
        fontWeight: .semibold
    )
}
