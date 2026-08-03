//
//  SaveDocumentUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 28/06/2026.
//

import Testing
import Entity
import DataSourceMocks
import UseCase

@Suite("SaveDocumentUseCase", .tags(.document))
struct SaveDocumentUseCaseTests {
    private let repository: InMemoryDocumentPersistenceRepository
    private let sut: SaveDocumentUseCase

    init() {
        self.repository = InMemoryDocumentPersistenceRepository(seed: [])
        self.sut = SaveDocumentUseCase(persistence: repository)
    }

    @Test func `New document saving succeded`() async throws {

        let newDocument = Document.fixture()
        try await sut(newDocument)
        let document = try await repository.fetch(by: newDocument.id)

        #expect(document != nil)
        #expect(document?.id == newDocument.id)

    }

    @Test
    func `New document saving failed`() async throws {
        let newDocument = Document.fixture()

        await repository.setFailure(.failedSave)

        await #expect(
            throws: PersistenceError.failedSave,
            "Must throw error",
            performing: {
                try await sut(newDocument)
            }
        )

    }

}
