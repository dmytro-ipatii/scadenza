//
//  SearchDocumentUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Repository
import Entity

public protocol SearchDocumentUseCaseProtocol: Sendable {
    func callAsFunction(_ query: String) async throws -> [Document]
}

public struct SearchDocumentUseCase: SearchDocumentUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction(_ query: String) async throws -> [Document] {
        return try await persistence.search(query)
    }
}
