//
//  DSFieldState.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import Foundation

public enum DSFieldState: Equatable {
    case idle
    case disabled
    case focused
    case error(message: String)

    public init(isDisabled: Bool, isFocused: Bool, errorMessage: String?) {
        if isDisabled { self = .disabled }
        else if let errorMessage { self = .error(message: errorMessage) }
        else if isFocused { self = .focused}
        else { self =  .idle }
    }

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
