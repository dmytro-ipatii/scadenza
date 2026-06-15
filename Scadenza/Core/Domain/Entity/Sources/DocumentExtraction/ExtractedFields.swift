//
//  ExtractedFields.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct ExtractedFields: Sendable, Hashable {
    public let kind: DocumentKind
    public let counterparty: String?
    public let totalAmount: MonetaryAmount?
    public let dates: [Document.Draft.DraftDate]
    public let summary: String
    public let recommendedAction: String

    public init(
        kind: DocumentKind,
        counterparty: String?,
        totalAmount: MonetaryAmount?,
        dates: [Document.Draft.DraftDate],
        summary: String,
        recommendedAction: String,
    ) {
        self.kind = kind
        self.counterparty = counterparty
        self.totalAmount = totalAmount
        self.dates = dates
        self.summary = summary
        self.recommendedAction = recommendedAction
    }
}
