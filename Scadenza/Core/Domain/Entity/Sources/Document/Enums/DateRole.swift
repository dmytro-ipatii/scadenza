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
}
