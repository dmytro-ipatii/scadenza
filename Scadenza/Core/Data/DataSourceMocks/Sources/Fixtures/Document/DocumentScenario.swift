//
//  DocumentScenario.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 24/06/2026.
//

import Foundation
import Entity

public enum DocumentScenario {
    // Overdue 3 days — folds into "This Week"
    public static let overdueUtilityBill = Document.fixture(
        kind: .utilityBill,
        counterparty: "Enel Energia",
        totalAmount: .fixture(value: 87.50),
        dates: [.fixtureDue(
                by: .now.byAdding(
                    days: -3
                )
            ),
        ],
    )
    // Due in 2 days — this week
    public static let dueThisWeek = Document.fixture(
        kind: .taxNotice,
        counterparty: "Agenzia delle Entrate",
        totalAmount: .fixture(value: 1240.00),
        dates: [.fixtureDue(
                by: .now.byAdding(
                    days: 2
                )
            ),
        ]
    )
    // Warranty expiring in 10 days — next week
    public static let warrantyNextWeek = Document.fixture(
        kind: .warranty,
        counterparty: "DeLonghi",
        totalAmount: nil,
        dates: [.fixtureExpiration(
                by: .now.byAdding(days: 10)
            ),
        ]
    )
    // Renewal 40 days out — later
    public static let insuranceLater = Document.fixture(
        kind: .insurancePolicy,
        counterparty: "Generali",
        totalAmount: .fixture(value: 450.00),
        dates: [.fixtureRenewal(
                in: .now.byAdding(
                    days: 40
                )
            ),
        ],
    )
    // Two dates — exercises "other dates in this document"
    public static let multiDateContract = Document.fixture(
        kind: .contract,
        counterparty: "Vodafone",
        dates: [
            .fixtureIssue(
                by: .now
                    .byAdding(
                        days: -30
                    )
            ),
            .fixtureDue(
                by: .now
                    .byAdding(
                        days: 5
                    )
            ),
        ]
    )
    // Completed — must NOT appear in upcoming
    public static let completedReceipt = Document.fixture(
        kind: .receipt,
        counterparty: "Esselunga",
        totalAmount: .fixture(value: 23.40),
        dates: [.fixture(
                date: .now
                    .byAdding(
                        days: -1
                    ),
                role: .dueDate,
                isCompleted: true
            ),
        ],
        isCompleted: true
    )
    // Sparse — missing optionals (no amount, no counterparty, no dates)
    public static let sparseManualNote = Document.fixture(
        counterparty: nil,
        totalAmount: nil,
        dates: []
    )
    // Long string — layout / Dynamic Type stress
    public static let longCounterparty = Document.fixture(
        counterparty: "Consorzio Nazionale Servizi Idrici e Ambientali del Territorio Metropolitano",
        dates: [.fixtureDue(
                by: .now
                    .byAdding(
                        days: 3
                    )
            ),
        ]
    )
}

public extension DocumentScenario {
    /// Realistic mixed inbox — previews + integration-style tests.
    static let inbox: [Document] = [
        overdueUtilityBill,
        dueThisWeek,
        warrantyNextWeek,
        insuranceLater,
        multiDateContract,
        completedReceipt,
        sparseManualNote,
        longCounterparty,
    ]
    static let empty: [Document] = []

    /// Many docs spread across kinds and dates — list/scroll performance.
    static func many(
        _ count: Int = 30
    ) -> [Document] {
        (
            0..<count
        ).map { i in
            Document
                .fixture(
                    kind: DocumentKind
                        .allCases[i % DocumentKind.allCases.count],
                    counterparty: "Counterparty \(i)",
                    dates: [.fixtureDue(
                            by: .now
                                .byAdding(
                                    days: i - 5
                                )
                            ),
                        ]
            )
        }
    }
}
