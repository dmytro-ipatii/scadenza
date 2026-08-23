//
//  DocumentCategoryScenario.swift
//  EntityFixtures
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

import Foundation
import Entity

public enum DocumentCategoryScenario {

    // MARK: - Empty

    public static let empty: [DocumentCategory] = []

    // MARK: - Single Category

    public static let utilityBills: [DocumentCategory] = [
        .fixture(
            kind: .utilityBill,
            documents: [
                DocumentScenario.overdueUtilityBill,
                DocumentScenario.dueThisWeek,
                DocumentScenario.completeUtilityBill
            ]
        )
    ]

    public static let contracts: [DocumentCategory] = [
        .fixture(
            kind: .contract,
            documents: [
                DocumentScenario.multiDateContract
            ]
        )
    ]

    // MARK: - Mixed Categories

    public static let inbox: [DocumentCategory] = [
        .fixture(
            kind: .utilityBill,
            documents: [
                DocumentScenario.overdueUtilityBill,
                DocumentScenario.completeUtilityBill
            ]
        ),
        .fixture(
            kind: .taxNotice,
            documents: [
                DocumentScenario.dueThisWeek,
                DocumentScenario.completeTaxNotice
            ]
        ),
        .fixture(
            kind: .insurancePolicy,
            documents: [
                DocumentScenario.renewal40DaysOut,
                DocumentScenario.completeInsurancePolicy
            ]
        ),
        .fixture(
            kind: .contract,
            documents: [
                DocumentScenario.multiDateContract
            ]
        ),
        .fixture(
            kind: .warranty,
            documents: [
                DocumentScenario.expiringNextWeek
            ]
        )
    ]

    // MARK: - Performance

    /// Large data set spread across every category.
    public static func many(_ count: Int = 100) -> [DocumentCategory] {
        let documents = DocumentScenario.many(count)

        let grouped = Dictionary(grouping: documents, by: \.kind)

        return DocumentKind.allCases.map { kind in
            .fixture(
                kind: kind,
                documents: grouped[kind] ?? []
            )
        }
    }

    // MARK: - Complete Documents

    public static let complete: [DocumentCategory] = [
        .fixture(
            kind: .utilityBill,
            documents: [
                DocumentScenario.completeUtilityBill
            ]
        ),
        .fixture(
            kind: .taxNotice,
            documents: [
                DocumentScenario.completeTaxNotice
            ]
        ),
        .fixture(
            kind: .insurancePolicy,
            documents: [
                DocumentScenario.completeInsurancePolicy
            ]
        )
    ]

    // MARK: - Edge Cases

    /// Every category exists but some are empty.
    public static let allCategories: [DocumentCategory] =
        DocumentKind.allCases.map { kind in
            .fixture(
                kind: kind,
                documents: DocumentScenario.inbox.filter { $0.kind == kind }
            )
        }

    /// One document in every category.
    public static let onePerCategory: [DocumentCategory] =
        DocumentKind.allCases.map { kind in
            .fixture(
                kind: kind,
                documents: [
                    Document.fixture(kind: kind)
                ]
            )
        }
}
