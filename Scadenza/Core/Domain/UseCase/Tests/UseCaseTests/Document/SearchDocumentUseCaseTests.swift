//
//  SearchDocumentUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 28/06/2026.
//
import Testing
import Entity
import DataSourceMocks
import UseCase

@Suite("SearchDocumentUseCase", .tags(.document))
struct SearchDocumentUseCaseTests {
    private let documents: [Document]
    private let repository: InMemoryDocumentPersistenceRepository
    private let sut: SearchDocumentUseCase

    init() {
        self.documents = [
            Document.fixture(
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
                counterparty: "Enel Energia",
            ),
            Document.fixture(
                rawText: "",
                counterparty: "Enel Energia",
            ),
            Document.fixture(
                rawText: """
                    AGENZIA DELLE ENTRATE
                    Avviso di pagamento - Modello F24
                    Contribuente: Mario Rossi
                    Codice fiscale: RSSMRA80A01H501U
                    Tributo: IMU saldo 2026 - codice tributo 3918
                    Importo dovuto: € 1.240,00
                    Effettuare il versamento tramite modello F24.
                    """,
                counterparty: "Agenzia delle Entrate",
            ),
            DocumentScenario.insuranceLater,
            DocumentScenario.completedReceipt,
        ]
        self.repository = InMemoryDocumentPersistenceRepository(seed: documents)
        self.sut = SearchDocumentUseCase(persistence: repository)
    }

    @Test
    func `Search returns some documents`() async throws {

        let billsSearchResults = try await sut("Enel Energia")
        let taxesSearchResults = try await sut("Agenzia delle Entrate")

        #expect(billsSearchResults.count == 2)
        #expect(taxesSearchResults.count == 1)

    }

    @Test
    func `Search returns empty results`() async throws {
        let searchResultsTIM = try await sut("TIM")
        let withEmptyValueResults = try await sut("")
        let withEmptySpaceValueResults = try await sut(" ")

        #expect(searchResultsTIM.isEmpty)
        #expect(withEmptyValueResults.isEmpty)
        #expect(withEmptySpaceValueResults.isEmpty)
    }

}

