//
//  ColorToken.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 06/08/2026.
//

import SwiftUI

public enum DSColor {

    // MARK: Brand
    public static let accent = Color("accent", bundle: .module)
    public static let accentTint = Color("accent-tint", bundle: .module)

    // MARK: Background
    public static let background = Color("background", bundle: .module)

    // MARK: Surface
    public static let surfaceBase = Color("surface-base", bundle: .module)
    public static let surfacePrimary = Color("surface-primary", bundle: .module)
    public static let surfaceInverse = Color("surface-inverse", bundle: .module)
    public static let surfaceSecondary = Color("surface-secondary", bundle: .module)
    public static let surfaceElevation = Color("surface-elevation", bundle: .module)
    public static let field = Color("field", bundle: .module)

    // MARK: Text
    public static let textPrimary = Color("text-primary", bundle: .module)
    public static let textInverse = Color("text-inverse", bundle: .module)
    public static let textQuaternary = Color("text-quaternary", bundle: .module)
    public static let textSecondary = Color("text-secondary", bundle: .module)
    public static let textTertiary = Color("text-tertiary", bundle: .module)
    public static let inkAccent = Color("ink-accent", bundle: .module)
    public static let inkOverlay = Color("ink-overlay", bundle: .module)
    public static let ink = Color("ink", bundle: .module)

    // MARK: Border
    public static let border = Color("border", bundle: .module)
    public static let borderStrong = Color("border", bundle: .module)

    // MARK: Status
    public static let success = Color("success", bundle: .module)
    public static let warning = Color("warning", bundle: .module)
    public static let danger = Color("danger", bundle: .module)
    public static let dangerTint = Color("danger-tint", bundle: .module)
    public static let disabled = Color("disabled", bundle: .module)
    public static let inactive = Color("inactive", bundle: .module)
}
