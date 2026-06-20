//
//  LoadDocumentDetailsUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Entity
import Repository

public protocol LoadDocumentDetailsUseCaseProtocol: Sendable {
    func callAsFunction(_ documentId: DocumentID) async throws(PersistenceError) -> Document?
}

public struct LoadDocumentDetailsUseCase: LoadDocumentDetailsUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction(_ documentId: DocumentID) async throws(PersistenceError) -> Document? {
        return try await persistence.fetch(by: documentId)
    }
}
