//
//  DSCheckmarkVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public enum DSCheckmarkVariant {
    case empty
    case inProgress
    case completed

    var appearance: DSCheckmarkApearance {
        switch self {
        case .empty:
            DSCheckmarkApearance.empty
        case .inProgress:
            DSCheckmarkApearance.inProgress
        case .completed:
            DSCheckmarkApearance.completed
        }
    }
}
