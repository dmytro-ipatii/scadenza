//
//  InMemoryDocumentRepository.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 20/06/2026.
//

import Foundation
import Entity
import Repository

public actor InMemoryDocumentPersistenceRepository: DocumentPersistenceRepositoryProtocol {
    private var storage: [DocumentID: Document]
    private var failure: PersistenceError?

    public init(seed: [Document] = []) {
        self.storage = Dictionary(
            seed.map {($0.id, $0)},
            uniquingKeysWith: ({ (_, new) in new })
        )
    }

    public func setFailure(_ error: PersistenceError?) {
        self.failure = error
    }

    public func save(_ document: Entity.Document) async throws(Entity.PersistenceError) {
        if let failure = failure {
            throw failure
        }

        storage[document.id] = document
    }

    public func update(_ document: Entity.Document) async throws(Entity.PersistenceError) {
        if let failure = failure {
            throw failure
        }

        guard storage[document.id] != nil else { throw Entity.PersistenceError.notFound }
        storage[document.id] = document
    }

    public func delete(_ documentID: Entity.DocumentID) async throws(Entity.PersistenceError) {
        if let failure {
            throw failure
        }

        storage[documentID] = nil
    }

    public func fetch(by id: Entity.DocumentID) async throws(Entity.PersistenceError) -> Entity.Document? {
        if let failure {
            throw failure
        }

        return storage[id]
    }

    public func fetchAll() async throws(Entity.PersistenceError) -> [Entity.Document] {

        if let failure {
            throw failure
        }

        return storage.values.sorted { $0.capturedAt > $1.capturedAt }
    }

    public func fetchUpcoming(
        within days: Int,
        now: Date
    ) async throws(Entity.PersistenceError) -> [Entity.UpcomingDeadline] {

        if let failure {
            throw failure
        }

        let horizon = now.byAdding(days: days)

        return storage.values.flatMap { doc in
            doc.dates.filter { !$0.isCompleted && $0.date < horizon }
                .map { UpcomingDeadline(dateEntry: $0, document: doc)}
        }
    }

    public func search(_ query: String) async throws(Entity.PersistenceError) -> [Entity.Document] {
        if let failure {
            throw failure
        }

        guard query.isEmpty else { return [] }

        return storage.values.filter { $0.rawText.localizedStandardContains(query)
            || $0.counterparty?.localizedStandardContains(query) ?? false}
    }

}
