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

    public let rawText: String
    public let detectedLanguages: [String]

    public let kind: DocumentKind
    public let counterparty: String?
    public let totalAmount: MonetaryAmount?
    public let summary: String
    public let recommendedAction: String

    public let dates: [DateEntry]
    public let reminder: Reminder?
    public let isCompleted: Bool

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
