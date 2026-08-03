//
//  DocumentPersistenceRepository.swift
//  DataSource
//
//  Created by Dmytro Ipatii on 03/08/2026.
//
import Foundation
import Repository
import Entity

public actor DocumentPersistenceRepository: DocumentPersistenceRepositoryProtocol {
    public func save(_ document: Entity.Document) async throws(Entity.PersistenceError) {

    }

    public func update(_ document: Entity.Document) async throws(Entity.PersistenceError) {

    }

    public func delete(_ documentID: Entity.DocumentID) async throws(Entity.PersistenceError) {

    }

    public func fetch(by id: Entity.DocumentID) async throws(Entity.PersistenceError) -> Entity.Document? {
        nil
    }

    public func fetchAll() async throws(Entity.PersistenceError) -> [Entity.Document] {
        []
    }

    public func fetchUpcoming(within days: Int, now: Date) async throws(Entity.PersistenceError) -> [Entity.UpcomingDeadline] {
        []
    }

    public func search(_ query: String) async throws(Entity.PersistenceError) -> [Entity.Document] {
        []
    }

}
