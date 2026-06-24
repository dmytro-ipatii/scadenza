//
//  TimeInterval+EXT.swift
//  Entity
//
//  Created by Dmytro Ipatii on 24/06/2026.
//

import Foundation

public extension TimeInterval {

    static func daysToSeconds(days: Int) -> TimeInterval {
        return TimeInterval(days * 24 * 60 * 60)
    }

    static func minutesToSeconds(minutes: Int) -> TimeInterval {
        return TimeInterval(minutes * 60 * 60)
    }

}
