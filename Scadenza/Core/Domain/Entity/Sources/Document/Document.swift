//
//  Document.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct Document: Sendable, Identifiable, Hashable {
    public let id: DocumentID
    public let capturedAt: Date
    public let sourceKind: SourceKind
    public let sourceReference: AssetReference

    public private(set) var rawText: String
    public let detectedLanguages: [String]

    public let kind: DocumentKind
    public private(set) var counterparty: String?
    public let totalAmount: MonetaryAmount?
    public let summary: String
    public let recommendedAction: String

    public private(set) var dates: [DateEntry]
    public private(set) var reminder: Reminder?
    public private(set) var isCompleted: Bool

    public init(
        id: DocumentID,
        capturedAt: Date,
        sourceKind: SourceKind,
        sourceReference: AssetReference,
        rawText: String,
        detectedLanguages: [String],
        kind: DocumentKind,
        counterparty: String?,
        totalAmount: MonetaryAmount?,
        summary: String,
        recommendedAction: String,
        dates: [DateEntry],
        reminder: Reminder?,
        isCompleted: Bool,
    ) {
        self.id = id
        self.capturedAt = capturedAt
        self.sourceKind = sourceKind
        self.sourceReference = sourceReference
        self.rawText = rawText
        self.detectedLanguages = detectedLanguages
        self.kind = kind
        self.counterparty = counterparty
        self.totalAmount = totalAmount
        self.summary = summary
        self.recommendedAction = recommendedAction
        self.dates = dates
        self.reminder = reminder
        self.isCompleted = isCompleted
    }
}

public extension Document {
    mutating func update(isCompleted: Bool) {
        self.isCompleted = isCompleted
    }

    mutating func update(rawText: String) {
        self.rawText = rawText
    }

    mutating func update(counterparty: String?) {
        self.counterparty = counterparty
    }

    mutating func update(dates: [DateEntry]) {
        self.dates = dates
    }

    mutating func update(reminder: Reminder?) {
        self.reminder = reminder
    }
}
