//
//  AppearanceOptionVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

public enum AppearanceOptionVariant {
    case idle
    case selected

    var appearance: AppearanceOptionAppearance {
        switch self {
        case .idle:
                .idle
        case .selected:
                .selected
        }
    }
}
