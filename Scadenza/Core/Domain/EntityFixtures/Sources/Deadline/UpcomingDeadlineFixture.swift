//
//  UpcomingDeadlineFixture.swift
//  EntityFixtures
//
//  Created by Dmytro Ipatii on 05/08/2026.
//

import Entity

public extension UpcomingDeadline {

    static func fixture(
        dateEntry: DateEntry,
        document: Document
    ) -> Self {
        UpcomingDeadline(
            dateEntry: dateEntry,
            document: document
        )
    }
}
