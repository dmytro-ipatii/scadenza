//
//  DSFieldState.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import Foundation

public enum DSFieldState {
    case idle
    case disabled
    case focused
    case error(message: String)

    var isFocused: Bool {
        if case .focused = self {
            true
        } else {
            false
        }
    }

    var isDisabled: IsDisabled {
        var isDisabled: IsDisabled = false

        if case .disabled = self {
            isDisabled = true
        }

        return isDisabled
    }
}
