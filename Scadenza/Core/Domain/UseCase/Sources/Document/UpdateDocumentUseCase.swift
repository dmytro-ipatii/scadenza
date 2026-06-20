//
//  UpdateDocumentUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Repository
import Entity

public protocol UpdateDocumentUseCaseProtocol: Sendable {
    func callAsFunction(_ document: Document) async throws((PersistenceError))
}

public struct UpdateDocumentUseCase: UpdateDocumentUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction(_ document: Document) async throws(PersistenceError) {
        try await persistence.update(document)
    }
}
