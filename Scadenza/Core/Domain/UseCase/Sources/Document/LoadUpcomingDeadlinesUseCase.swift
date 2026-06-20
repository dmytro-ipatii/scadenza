//
//  LoadUpcomingDeadlinesUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Foundation
import Repository
import Entity

public protocol LoadUpcomingDeadlinesUseCaseProtocol: Sendable {
    func callAsFunction(within days: Int, now: Date, calendar: Calendar) async throws -> UpcomingDeadlines
}

public struct LoadUpcomingDeadlinesUseCase: LoadUpcomingDeadlinesUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction(within days: Int, now: Date, calendar: Calendar) async throws -> UpcomingDeadlines {

        let deadlines = try await persistence.fetchUpcoming(within: days, now: now)

        return Self.group(
            deadlines,
            now: now,
            calendar: calendar
        )
    }

    static func group(
        _ deadlines: [UpcomingDeadline],
        now: Date,
        calendar: Calendar
    ) -> UpcomingDeadlines {

        // Determine the first weekday + user's timezone
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: now) else {
            return UpcomingDeadlines(
                thisWeek: [],
                nextWeek: [],
                later: deadlines
            )
        }

        let endOfThisWeek = weekInterval.end
        let endOfTheNextWeek = calendar.date(byAdding: .weekOfYear, value: 1, to: endOfThisWeek) ?? endOfThisWeek

        var thisWeekDeadlines: [UpcomingDeadline] = []
        var nextWeekDeadlines: [UpcomingDeadline] = []
        var laterDeadlines: [UpcomingDeadline] = []

        for deadline in deadlines {

            let deadlineDate = deadline.dateEntry.date

            if deadlineDate < endOfThisWeek {
                thisWeekDeadlines.append(deadline)
            } else if deadlineDate < endOfTheNextWeek {
                nextWeekDeadlines.append(deadline)
            } else {
                laterDeadlines.append(deadline)
            }

        }

        return UpcomingDeadlines(
            thisWeek: thisWeekDeadlines.sortByDate(),
            nextWeek: nextWeekDeadlines.sortByDate(),
            later: laterDeadlines.sortByDate()
        )
    }
}

private extension Array where Element == UpcomingDeadline {
    func sortByDate() -> [UpcomingDeadline] {
        sorted { $0.dateEntry.date < $1.dateEntry.date }
    }
}
