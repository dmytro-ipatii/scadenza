//
//  DeleteDocumentUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Repository
import Entity

public protocol DeleteDocumentUseCaseProtocol: Sendable {
    func callAsFunction(_ documentId: DocumentID) async throws(PersistenceError)
}

public struct DeleteDocumentUseCase: DeleteDocumentUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction(_ documentId: DocumentID) async throws(PersistenceError) {
        try await persistence.delete(documentId)
    }
}
