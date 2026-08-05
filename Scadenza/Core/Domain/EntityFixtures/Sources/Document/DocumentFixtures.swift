//
//  DocumentFixtures.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 22/06/2026.
//

import Foundation
import Entity

public extension Document {
    static func fixture(
        id: DocumentID = DocumentID(),
        capturedAt: Date = .now,
        sourceKind: SourceKind = .manualInput,
        sourceReference: AssetReference = .textFixture(),
        rawText: String = "",
        detectedLanguages: [String] = ["IT"],
        kind: DocumentKind = .utilityBill,
        counterparty: String? = "Enel Energia",
        totalAmount: MonetaryAmount? = .fixture(),
        summary: String = "",
        recommendedAction: String = "",
        dates: [DateEntry] = [],
        reminder: Reminder? = nil,
        isCompleted: Bool = false
    ) -> Document {

        return Document(
            id: id,
            capturedAt: capturedAt,
            sourceKind: sourceKind,
            sourceReference: sourceReference,
            rawText: rawText,
            detectedLanguages: detectedLanguages,
            kind: kind,
            counterparty: counterparty,
            totalAmount: totalAmount,
            summary: summary,
            recommendedAction: recommendedAction,
            dates: dates,
            reminder: reminder,
            isCompleted: isCompleted,
        )
    }
}
