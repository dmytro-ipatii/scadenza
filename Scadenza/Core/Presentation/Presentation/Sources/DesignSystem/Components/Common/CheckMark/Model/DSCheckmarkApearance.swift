//
//  DSCheckmarkApearance.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSCheckmarkApearance: Sendable {
    let background: Color
    let borderColor: Color

    public init(
        background: Color,
        borderColor: Color = Color.clear
    ) {
        self.background = background
        self.borderColor = borderColor
    }

    static let empty: DSCheckmarkApearance = Self(
        background: DSColor.surfaceElevation
    )

    static let completed: DSCheckmarkApearance = Self(
        background: DSColor.success
    )

    static let inProgress: DSCheckmarkApearance = Self(
        background: Color.clear,
        borderColor: DSColor.accent
    )
}
