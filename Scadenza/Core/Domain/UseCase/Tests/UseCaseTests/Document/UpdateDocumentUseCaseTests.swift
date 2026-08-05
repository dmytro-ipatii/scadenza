//
//  UpdateDocumentUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 29/06/2026.
//

import Testing
import Entity
import EntityFixtures
import DataSourceMocks
import UseCase

@Suite("UpdateDocumentUseCase", .tags(.document))
struct UpdateDocumentUseCaseTests {

    private let documents: [Document]
    private let repository: InMemoryDocumentPersistenceRepository
    private let sut: UpdateDocumentUseCase

    init() {
        documents = DocumentScenario.many()
        repository = InMemoryDocumentPersistenceRepository(documents: documents)
        sut = UpdateDocumentUseCase(persistence: repository)
    }

    @Test func `Update document with success`() async throws {

        var targetDocument = try #require(documents.first)
        targetDocument.update(isCompleted: true)

        try await sut(targetDocument)
        let document = try await repository.fetch(by: targetDocument.id)

        #expect(document != nil)
        #expect(document?.id == targetDocument.id)
        #expect(document?.isCompleted == targetDocument.isCompleted)
    }

    @Test func `Update document with failure`() async throws {
        var targetDocument = try #require(documents.first)
        targetDocument.update(isCompleted: true)

        await repository.setFailure(.failedUpdate)

        await #expect(throws: PersistenceError.failedUpdate, "Throw error updating element", performing: {
            try await sut(targetDocument)
        })
    }
}
