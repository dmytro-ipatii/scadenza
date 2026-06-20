//
//  Reminder.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct Reminder: Sendable, Identifiable, Hashable {
    public let id: ReminderID
    public let leadTime: TimeInterval
    public let calendarEventIdentifier: String?
    public let notificationEventIdentifier: String?

    public init(
        id: ReminderID,
        leadTime: TimeInterval,
        calendarEventIdentifier: String?,
        notificationEventIdentifier: String?,
    ) {
        self.id = id
        self.leadTime = leadTime
        self.calendarEventIdentifier = calendarEventIdentifier
        self.notificationEventIdentifier = notificationEventIdentifier
    }
}
