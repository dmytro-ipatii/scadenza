//
//  UpcomingDeadlines.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct UpcomingDeadlines: Sendable, Hashable {
    public let thisWeek: [UpcomingDeadline]
    public let nextWeek: [UpcomingDeadline]
    public let later: [UpcomingDeadline]
    public let expired: [UpcomingDeadline]

    public init(
        thisWeek: [UpcomingDeadline],
        nextWeek: [UpcomingDeadline],
        later: [UpcomingDeadline],
        expired: [UpcomingDeadline],
    ) {
        self.thisWeek = thisWeek
        self.nextWeek = nextWeek
        self.later = later
        self.expired = expired
    }
}
