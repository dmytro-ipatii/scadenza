//
//  Document+Draft.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public extension Document {

    struct Draft: Sendable {
        public let sourceKind: SourceKind
        public let assetReference: AssetReference

        public var kind: DocumentKind
        public var counterparty: String?
        public var totalAmount: MonetaryAmount?
        public var dates: [DraftDate]
        public var summary: String
        public var recommendedAction: String

        public init(
            sourceKind: SourceKind,
            assetReference: AssetReference,
            kind: DocumentKind,
            counterparty: String?,
            totalAmount: MonetaryAmount?,
            dates: [DraftDate],
            summary: String,
            recommendedAction: String,
        ) {
            self.sourceKind = sourceKind
            self.assetReference = assetReference
            self.kind = kind
            self.counterparty = counterparty
            self.totalAmount = totalAmount
            self.dates = dates
            self.summary = summary
            self.recommendedAction = recommendedAction
        }

        public struct DraftDate: Sendable, Hashable {
            public var date: Date
            public var role: DateRole

            public init(
                date: Date,
                role: DateRole,
            ) {
                self.date = date
                self.role = role
            }
        }
    }

}
