//
//  DateEntryFixture.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 24/06/2026.
//

import Foundation
import Entity

public extension DateEntry {
    static func fixture(
        id: DateEntryID = DateEntryID(),
        date: Date = .now,
        role: DateRole = .appointmentDate,
        isCompleted: Bool = false
    ) -> DateEntry {
        return DateEntry(
            id: id,
            date: date,
            role: role,
            isCompleted: isCompleted,
        )
    }

    static func fixtureIssue(by date: Date = .now) -> DateEntry {
        return .fixture(
            date: date,
            role: .issueDate
        )
    }

    static func fixtureAppointment(on date: Date = .now.byAdding(days: 2)) -> DateEntry {
        return .fixture(
            date: date,
            role: .appointmentDate
        )
    }

    static func fixtureDue(by date: Date = .now.byAdding(days: 7)) -> DateEntry {
        return .fixture(
            date: date,
            role: .dueDate
        )
    }

    static func fixtureExpiration(by date: Date = .now.byAdding(days: 7)) -> DateEntry {
        return .fixture(
            date: date,
            role: .expirationDate
        )
    }

    static func fixtureRenewal(in date: Date = .now.byAdding(days: 7)) -> DateEntry {
        return .fixture(
            date: date,
            role: .renewalDate
        )
    }

}
