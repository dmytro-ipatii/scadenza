//
//  UpcomingDeadline.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct UpcomingDeadline: Sendable, Identifiable, Hashable {
    public var id: DateEntryID { dateEntry.id }
    public let dateEntry: DateEntry
    public let document: Document

    public init(
        dateEntry: DateEntry,
        document: Document,
    ) {
        self.dateEntry = dateEntry
        self.document = document
    }
}
