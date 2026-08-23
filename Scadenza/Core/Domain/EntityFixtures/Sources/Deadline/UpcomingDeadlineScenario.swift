//
//  UpcomingDeadlineScenario.swift
//  EntityFixtures
//
//  Created by Dmytro Ipatii on 05/08/2026.
//

import Entity

public enum UpcomingDeadlineScenario {

    // MARK: - Expired

    /// Expired three days ago.
    public static let overdueUtilityBill = UpcomingDeadline.fixture(
        dateEntry: .fixtureDue(by: .now.byAdding(days: -3)),
        document: DocumentScenario.overdueUtilityBill
    )

    /// Expired one hour ago (time-sensitive).
    public static let expiredOneHourAgo = UpcomingDeadline.fixture(
        dateEntry: .fixtureDue(by: .now.addingTimeInterval(-3600)),
        document: Document.fixture(
            kind: .receipt,
            counterparty: "Amazon"
        )
    )

    // MARK: - This Week

    /// Due today.
    public static let dueToday = UpcomingDeadline.fixture(
        dateEntry: .fixtureDue(by: .now),
        document: Document.fixture(
            kind: .utilityBill,
            counterparty: "Fastweb"
        )
    )

    /// Due in two days.
    public static let dueThisWeek = UpcomingDeadline.fixture(
        dateEntry: .fixtureDue(by: .now.byAdding(days: 2)),
        document: DocumentScenario.dueThisWeek
    )

    /// Due later this week.
    public static let multiDateContract = UpcomingDeadline.fixture(
        dateEntry: .fixtureDue(by: .now.byAdding(days: 5)),
        document: DocumentScenario.multiDateContract
    )

    // MARK: - Next Week

    /// Expires next week.
    public static let expiringNextWeek = UpcomingDeadline.fixture(
        dateEntry: .fixtureExpiration(by: .now.byAdding(days: 10)),
        document: DocumentScenario.expiringNextWeek
    )

    /// Renews next week.
    public static let renewalNextWeek = UpcomingDeadline.fixture(
        dateEntry: .fixtureRenewal(in: .now.byAdding(days: 12)),
        document: Document.fixture(
            kind: .insurancePolicy,
            counterparty: "UnipolSai"
        )
    )

    // MARK: - Later

    /// Renewal in 40 days.
    public static let renewal40DaysOut = UpcomingDeadline.fixture(
        dateEntry: .fixtureRenewal(in: .now.byAdding(days: 40)),
        document: DocumentScenario.renewal40DaysOut
    )

    /// Warranty expiring in two months.
    public static let warrantyLater = UpcomingDeadline.fixture(
        dateEntry: .fixtureExpiration(by: .now.byAdding(days: 60)),
        document: Document.fixture(
            kind: .warranty,
            counterparty: "Apple"
        )
    )

    // MARK: - Completed

    /// Completed deadlines should never be returned by the repository.
    public static let completedReceipt = UpcomingDeadline.fixture(
        dateEntry: .fixture(
            date: .now.byAdding(days: -1),
            role: .dueDate,
            isCompleted: true
        ),
        document: DocumentScenario.completedReceipt
    )
}


public extension UpcomingDeadlineScenario {

    static let empty = UpcomingDeadlines(
        thisWeek: [],
        nextWeek: [],
        later: [],
        expired: []
    )

    static let thisWeek = UpcomingDeadlines(
        thisWeek: [
            dueToday,
            dueThisWeek,
            multiDateContract
        ],
        nextWeek: [],
        later: [],
        expired: []
    )

    static let nextWeek = UpcomingDeadlines(
        thisWeek: [],
        nextWeek: [
            expiringNextWeek,
            renewalNextWeek
        ],
        later: [],
        expired: []
    )

    static let later = UpcomingDeadlines(
        thisWeek: [],
        nextWeek: [],
        later: [
            renewal40DaysOut,
            warrantyLater
        ],
        expired: []
    )

    static let expired = UpcomingDeadlines(
        thisWeek: [],
        nextWeek: [],
        later: [],
        expired: [
            overdueUtilityBill,
            expiredOneHourAgo
        ]
    )

    static let inbox = UpcomingDeadlines(
        thisWeek: [
            dueToday,
            dueThisWeek,
            multiDateContract
        ],
        nextWeek: [
            expiringNextWeek,
            renewalNextWeek
        ],
        later: [
            renewal40DaysOut,
            warrantyLater
        ],
        expired: [
            overdueUtilityBill,
            expiredOneHourAgo
        ]
    )
}
