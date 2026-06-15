//
//  PartialExtractedDocument.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct PartialExtractedDocument: Sendable {
    public let kind: DocumentKind?
    public let counterparty: String?
    public let totalAmount: MonetaryAmount?
    public let dates: [DateEntry]
    public let summary: String?
    public let recommendedAction: String?

    public init(
        kind: DocumentKind?,
        counterparty: String?,
        totalAmount: MonetaryAmount?,
        dates: [DateEntry],
        summary: String?,
        recommendedAction: String?,
    ) {
        self.kind = kind
        self.counterparty = counterparty
        self.totalAmount = totalAmount
        self.dates = dates
        self.summary = summary
        self.recommendedAction = recommendedAction
    }
}
