//
//  AssetReference.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct AssetReference: Sendable, Identifiable, Hashable {
    public let id: AssetReferenceID
    public let kind: AssetKind
    public let relativePath: String
    public let mimeType: String
    public let createdAt: Date

    public init(
        id: AssetReferenceID,
        kind: AssetKind,
        relativePath: String,
        mimeType: String,
        createdAt: Date,
    ) {
        self.id = id
        self.kind = kind
        self.relativePath = relativePath
        self.mimeType = mimeType
        self.createdAt = createdAt
    }
}
