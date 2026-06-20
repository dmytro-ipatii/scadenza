//
//  IDs.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct EntityID<Owner>: Sendable, Hashable {
    public let rawValue: UUID

    public init(
        rawValue: UUID = UUID()
    ) {
        self.rawValue = rawValue
    }
}

public typealias DocumentID = EntityID<Document>
public typealias AssetReferenceID = EntityID<AssetReference>
public typealias DateEntryID = EntityID<DateEntry>
public typealias ReminderID = EntityID<Reminder>
