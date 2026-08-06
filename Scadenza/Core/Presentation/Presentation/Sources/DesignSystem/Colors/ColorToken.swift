//
//  ColorToken.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 06/08/2026.
//

import SwiftUI

public enum ColorToken {

    // MARK: Brand
    public static let accent = Color("accent", bundle: .module)

    // MARK: Background
    public static let background = Color("background", bundle: .module)

    // MARK: Surface
    public static let surface = Color("surface", bundle: .module)
    public static let surfaceSecondary = Color("surface-secondary", bundle: .module)
    public static let surfaceElevation = Color("surface-elevation", bundle: .module)

    // MARK: Text
    public static let textPrimary = Color("text-primary", bundle: .module)
    public static let textQuaternary = Color("text-quaternary", bundle: .module)
    public static let textSecondary = Color("text-secondary", bundle: .module)
    public static let textTertiary = Color("text-tertiary", bundle: .module)

    // MARK: Border
    public static let border = Color("border", bundle: .module)
    public static let borderStrong = Color("border", bundle: .module)

    // MARK: Status
    public static let success = Color("success", bundle: .module)
    public static let warning = Color("warning", bundle: .module)
    public static let danger = Color("danger", bundle: .module)
    public static let info = Color("info", bundle: .module)
    public static let disabled = Color("disabled", bundle: .module)
}
