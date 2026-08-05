//
//  LoadDocumentDetailsUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 27/06/2026.
//

import Testing
import Entity
import EntityFixtures
import DataSourceMocks
import UseCase

@Suite("LoadDocumentDetailsUseCase", .tags(.document))
struct LoadDocumentDetailsUseCaseTests {

    @Test
    func `Load document details succeded`() async throws {
        let documents = DocumentScenario.many()
        let targetDocumentId = try #require(documents.first).id

        let repository = InMemoryDocumentPersistenceRepository(documents: documents)
        let sut = LoadDocumentDetailsUseCase(persistence: repository)

        let document = try await sut(targetDocumentId)

        #expect(document != nil)
        #expect(document?.id == targetDocumentId)
    }

    @Test
    func `Load document details failed`() async throws {
        let documents = DocumentScenario.many()
        let targetDocumentId = try #require(documents.first).id

        let repository = InMemoryDocumentPersistenceRepository(documents: documents)
        let sut = LoadDocumentDetailsUseCase(persistence: repository)

        await repository.setFailure(.notFound)

        await #expect(throws: PersistenceError.notFound, "The document is not found", performing: {
            try await sut(targetDocumentId)
        })
    }

}
