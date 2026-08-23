//
//  DSOptionIcon.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSOptionIconConfigs: Sendable {
    let icon: ImageResource
    let color: Color

    public init(
        icon: ImageResource,
        color: Color = DSColor.textTertiary
    ) {
        self.icon = icon
        self.color = color
    }
}
