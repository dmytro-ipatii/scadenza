//
//  DeleteDocumentUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 27/06/2026.
//

import Testing
import Entity
import EntityFixtures
import DataSourceMocks
import UseCase

@Suite("DeleteDocumentUseCase", .tags(.document))
struct DeleteDocumentUseCaseTests {
    private let documents: [Document]
    private let repository: InMemoryDocumentPersistenceRepository
    private let sut: DeleteDocumentUseCase

    init() {
        documents = DocumentScenario.many()
        repository = InMemoryDocumentPersistenceRepository(seed: documents)
        sut = DeleteDocumentUseCase(persistence: repository)
    }

    @Test
    func `Delete document by id succeded`() async throws {

        let targetDocumentId = try #require(documents.first).id
        try await sut(targetDocumentId)

        let remainingDocuments = try await repository.fetchAll()

        #expect(remainingDocuments.count == documents.count - 1)
        #expect(!remainingDocuments.contains { $0.id == targetDocumentId })
    }

    @Test
    func `Delete document by id failed`() async throws {
        let targetDocumentId = try #require(documents.first).id

        await repository.setFailure(.failedDelete)

        await #expect(throws: PersistenceError.failedDelete, "Throw failed delete error", performing: {
            try await sut(targetDocumentId)
        })
    }

}
