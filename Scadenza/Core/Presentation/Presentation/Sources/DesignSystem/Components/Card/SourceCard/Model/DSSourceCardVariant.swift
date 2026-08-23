//
//  DSSourceCardVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 21/08/2026.
//

import SwiftUI

public enum DSSourceCardVariant {
    case neutral
    case selected

    var isSelected: Bool {
        self == .selected
    }

    var higlightOpacity: CGFloat {
        isSelected ? 1 : 0
    }

    var higlightColor: Color {
        isSelected ? DSColor.success : .clear
    }
}
