//
//  Date+EXT.swift
//  Entity
//
//  Created by Dmytro Ipatii on 24/06/2026.
//

import Foundation

public extension Date {
    func byAdding(
        days: Int = 0,
        hours: Int = 0,
        minutes: Int = 0
    ) -> Date {
        let totalSeconds = (days * 24 * 60 * 60) +
        (hours * 60 * 60) +
        (minutes * 60)

        return addingTimeInterval(TimeInterval(totalSeconds))
    }
}
