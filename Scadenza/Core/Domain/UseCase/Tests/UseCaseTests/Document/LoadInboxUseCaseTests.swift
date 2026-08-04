//
//  LoadInboxUseCaseTests.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 27/06/2026.
//

import Testing
import Entity
import EntityFixtures
import UseCase
import DataSourceMocks

@Suite("LoadInboxUseCase", .tags(.document))
struct LoadInboxUseCaseTests {

    @Test
    func `Load inbox documents returns elements`() async throws {
        let documents = DocumentScenario.many()
        let sut = LoadInboxUseCase(persistence: InMemoryDocumentPersistenceRepository(seed: documents))

        let categories = try await sut()

        #expect(!categories.isEmpty)
    }

    @Test
    func `Load inbox returns empty result`() async throws {
        let documents = DocumentScenario.empty
        let sut = LoadInboxUseCase(persistence: InMemoryDocumentPersistenceRepository(seed: documents))

        let categories = try await sut()

        #expect(categories.isEmpty)
    }

}
