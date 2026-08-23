//
//  DateEntry+EXT.swift
//  Entity
//
//  Created by Dmytro Ipatii on 05/08/2026.
//

import Foundation

public extension DateEntry {
    func isExpired(
        now: Date,
        calendar: Calendar
    ) -> Bool {

        if self.hasTime {
            date < now
        } else {
            date < calendar.startOfDay(for: now)
        }
    }
}
