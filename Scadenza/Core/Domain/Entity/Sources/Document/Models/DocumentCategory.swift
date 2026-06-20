//
//  DocumentCategory.swift
//  Entity
//
//  Created by Dmytro Ipatii on 20/06/2026.
//

public struct DocumentCategory: Sendable, Identifiable, Hashable {
    public var id: DocumentKind { kind }
    public let kind: DocumentKind
    public let documents: [Document]

    public init(kind: DocumentKind, documents: [Document]) {
        self.kind = kind
        self.documents = documents
    }
}
