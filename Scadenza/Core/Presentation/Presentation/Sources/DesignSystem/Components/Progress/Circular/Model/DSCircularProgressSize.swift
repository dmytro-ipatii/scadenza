//
//  DSCircularProgressSize.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public enum DSCircularProgressSize {
    case small
    case medium
    case custom(size: CGFloat)

    var value: CGFloat {
        switch self {
        case .small:
            64
        case .medium:
            88
        case .custom(let size):
            size
        }
    }

}
