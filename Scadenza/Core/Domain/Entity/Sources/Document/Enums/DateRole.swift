//
//  DateRole.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public enum DateRole: String, Sendable, CaseIterable {
    case dueDate
    case expirationDate
    case issueDate
    case appointmentDate
    case renewalDate

    public var systemImage: String {
        switch self {
        case .dueDate:
            return "calendar.badge.clock"

        case .expirationDate:
            return "hourglass"

        case .issueDate:
            return "calendar.badge.plus"

        case .appointmentDate:
            return "calendar.badge.exclamationmark"

        case .renewalDate:
            return "arrow.trianglehead.2.clockwise.rotate.90.circle.fill"
        }
    }
}
