//
//  DSButtonVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

public enum DSButtonVariant: Sendable {
    case accent
    case primary
    case secondary
    case destructive
    case textual
}

public extension DSButtonVariant {
    var appearance: DSButtonAppearance {
        DSButtonAppearance(from: self)
    }
}
