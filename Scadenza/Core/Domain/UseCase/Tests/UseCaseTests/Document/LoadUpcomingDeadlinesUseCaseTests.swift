//
//  LoadUpcomingDeadlinesUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 28/06/2026.
//

import Foundation
import Testing
import Entity
import DataSourceMocks
@testable import UseCase

@Suite("LoadUpcomingDeadlinesUseCase", .tags(.document))
struct LoadUpcomingDeadlinesUseCaseTests {

    private static let calendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(identifier: "Europe/Rome")!
        calendar.firstWeekday = 2 // Week starts from Monday

        return calendar
    }()

    private static let now = calendar.date(
        from: DateComponents(
            year: 2026,
            month: 6,
            day: 22 // Monday
        )
    )!

    private func deadline(daysFromNow days: Int) -> UpcomingDeadline {
        let date = Self.calendar.date(
            byAdding: .day,
            value: days,
            to: Self.now
        )!

        return UpcomingDeadline(
            dateEntry: .fixture(date: date, role: .dueDate),
            document: .fixture()
        )
    }

    @Test
    func `Bucket deadline into this week/next week/later`() {

        let thisWeek = deadline(daysFromNow: 0)
        let nextWeek = deadline(daysFromNow: 7)
        let later = deadline(daysFromNow: 21)

        let result = LoadUpcomingDeadlinesUseCase.group(
            [later, nextWeek, thisWeek],
            now: Self.now,
            calendar: Self.calendar
        )

        #expect(result.thisWeek.map(\.id) == [thisWeek.id])
        #expect(result.nextWeek.map(\.id) == [nextWeek.id])
        #expect(result.later.map(\.id) == [later.id])
    }

    @Test
    func `Sorts each bucket by date`() {
        let early = deadline(daysFromNow: 1)
        let late = deadline(daysFromNow: 4)

        let result = LoadUpcomingDeadlinesUseCase.group(
            [late, early],
            now: Self.now,
            calendar: Self.calendar
        )

        #expect(result.thisWeek.map(\.id) == [early.id, late.id])
    }

    @Test
    func `Returns all three buckets empty`() {
        let result = LoadUpcomingDeadlinesUseCase.group(
            [],
            now: Self.now,
            calendar: Self.calendar
        )

        #expect(result.thisWeek.isEmpty)
        #expect(result.nextWeek.isEmpty)
        #expect(result.later.isEmpty)
    }



}
