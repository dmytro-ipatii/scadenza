//
//  DocumentPersistenceRepositoryProtocol.swift
//  Repository
//
//  Created by Dmytro Ipatii on 17/06/2026.
//

import Foundation
import Entity

public protocol DocumentPersistenceRepositoryProtocol: Sendable {

    func save(_ document: Document) async throws
    func update(_ document: Document) async throws
    func delete(_ documentID: DocumentID) async throws

    func fetch(by id: DocumentID) async throws -> Document?
    func fetchAll() async throws -> [Document]
    func fetchUpcoming(within days: Int, now: Date) async throws -> [UpcomingDeadline]
    func search(_ query: String) async throws -> [Document]
}
