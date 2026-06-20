//
//  LoadInboxUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 19/06/2026.
//

import Repository
import Entity

public protocol LoadInboxUseCaseProtocol: Sendable {
    func callAsFunction() async throws -> [DocumentCategory]
}

public struct LoadInboxUseCase: LoadInboxUseCaseProtocol, Sendable {
    private let persistence: any DocumentPersistenceRepositoryProtocol

    public init(persistence: any DocumentPersistenceRepositoryProtocol) {
        self.persistence = persistence
    }

    public func callAsFunction() async throws -> [DocumentCategory] {

        let documents = try await persistence.fetchAll()
        let grouped = Dictionary(grouping: documents, by: \.kind)

        return DocumentKind.allCases.compactMap { kind in

            guard let docs = grouped[kind], !docs.isEmpty else { return nil }

            return DocumentCategory(kind: kind, documents: docs)
        }
    }
}
