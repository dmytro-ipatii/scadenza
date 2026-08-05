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

    /// Italian electricity bill, imported as PDF. Fully populated — drives
    /// search (rawText), the detail summary, and a scheduled reminder.
    public static let completeUtilityBill = Document.fixture(
        sourceKind: .pdfImport,
        sourceReference: .pdfFixture(),
        rawText: """
        ENEL ENERGIA S.p.A.
        Bolletta luce - Mercato Libero
        Intestatario: Mario Rossi
        Codice cliente: 1234567890
        POD: IT001E1234567A
        Periodo di fatturazione: 01/05/2026 - 31/05/2026
        Consumo rilevato: 312 kWh
        Importo totale da pagare: € 87,50
        Modalita di pagamento: addebito diretto SDD
        """,
        detectedLanguages: ["IT"],
        kind: .utilityBill,
        counterparty: "Enel Energia",
        totalAmount: .fixture(value: 87.50),
        summary: "Bolletta Enel per l'energia elettrica di maggio 2026, importo 87,50 € con addebito SDD.",
        recommendedAction: "Verifica che l'addebito SDD vada a buon fine entro la scadenza.",
        dates: [.fixtureDue(by: .now.byAdding(days: 2))],
        reminder: .fixture(leadTime: 60 * 60 * 24)
    )

    /// Italian tax notice, captured by camera. Larger amount, longer horizon.
    public static let completeTaxNotice = Document.fixture(
        sourceKind: .camera,
        sourceReference: .imageFixture(),
        rawText: """
        AGENZIA DELLE ENTRATE
        Avviso di pagamento - Modello F24
        Contribuente: Mario Rossi
        Codice fiscale: RSSMRA80A01H501U
        Tributo: IMU saldo 2026 - codice tributo 3918
        Importo dovuto: € 1.240,00
        Effettuare il versamento tramite modello F24.
        """,
        detectedLanguages: ["IT"],
        kind: .taxNotice,
        counterparty: "Agenzia delle Entrate",
        totalAmount: .fixture(value: 1240.00),
        summary: "Avviso IMU dell'Agenzia delle Entrate, saldo 2026 pari a 1.240,00 € da versare con F24.",
        recommendedAction: "Prepara il modello F24 e versa l'importo entro il termine indicato.",
        dates: [.fixtureDue(by: .now.byAdding(days: 18))]
    )

    /// Insurance policy renewal, PDF from email. Exercises the renewal role.
    public static let completeInsurancePolicy = Document.fixture(
        sourceKind: .pdfImport,
        sourceReference: .pdfFixture(),
        rawText: """
        GENERALI ITALIA S.p.A.
        Polizza Auto - Responsabilita Civile
        Contraente: Mario Rossi
        Numero polizza: 0098765432
        Veicolo: targa AB123CD
        Premio annuo: € 450,00
        La polizza e in scadenza: valutare il rinnovo.
        """,
        detectedLanguages: ["IT"],
        kind: .insurancePolicy,
        counterparty: "Generali",
        totalAmount: .fixture(value: 450.00),
        summary: "Polizza RC Auto Generali, premio annuo 450,00 €, in rinnovo ad agosto 2026.",
        recommendedAction: "Decidi se rinnovare o confrontare altre offerte prima del rinnovo.",
        dates: [.fixtureRenewal(in: .now.byAdding(days: 40))]
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

    /// All complete documents — use in Search / Detail previews and tests.
    static let complete: [Document] = [
        completeUtilityBill,
        completeTaxNotice,
        completeInsurancePolicy,
    ]
}
