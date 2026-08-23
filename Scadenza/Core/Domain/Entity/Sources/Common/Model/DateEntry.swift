//
//  DateEntry.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct DateEntry: Sendable, Identifiable, Hashable {
    public let id: DateEntryID
    public let date: Date
    public let hasTime: Bool
    public let role: DateRole
    public let isCompleted: Bool

    public init(
        id: DateEntryID,
        date: Date,
        hasTime: Bool,
        role: DateRole,
        isCompleted: Bool,
    ) {
        self.id = id
        self.date = date
        self.hasTime = hasTime
        self.role = role
        self.isCompleted = isCompleted
    }
}
