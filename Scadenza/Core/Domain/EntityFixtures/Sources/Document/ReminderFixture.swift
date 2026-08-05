//
//  File.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 22/06/2026.
//

import Foundation
import Entity

public extension Reminder {

    static func fixture(
        id: ReminderID = ReminderID(),
        leadTime: TimeInterval = TimeInterval(),
        calendarEventIdentifier: String? = nil,
        notificationEventIdentifier: String? = nil
    ) -> Reminder {

        return Reminder(
            id: id,
            leadTime: leadTime,
            calendarEventIdentifier: calendarEventIdentifier,
            notificationEventIdentifier: notificationEventIdentifier,
        )
    }
}
