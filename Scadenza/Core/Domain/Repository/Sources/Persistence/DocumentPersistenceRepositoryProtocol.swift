//
//  DocumentPersistenceRepositoryProtocol.swift
//  Repository
//
//  Created by Dmytro Ipatii on 17/06/2026.
//

import Foundation
import Entity

public protocol DocumentPersistenceRepositoryProtocol: Sendable {

    func save(_ document: Document) async throws(PersistenceError)
    func update(_ document: Document) async throws(PersistenceError)
    func delete(_ documentID: DocumentID) async throws(PersistenceError)

    func fetch(by id: DocumentID) async throws(PersistenceError) -> Document?
    func fetchAll() async throws(PersistenceError) -> [Document]
    func fetchUpcoming(within days: Int, now: Date) async throws(PersistenceError) -> [UpcomingDeadline]
    func search(_ query: String) async throws(PersistenceError) -> [Document]
}
