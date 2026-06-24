//
//  AssetReferenceFixture.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 22/06/2026.
//

import Foundation
import Entity

public extension AssetReference {
    static func fixture(
        id: AssetReferenceID = AssetReferenceID(),
        kind: AssetKind,
        relativePath: String = "",
        mimeType: String, // TODO: Create an enum types
        createdAt: Date = .now,
    ) -> AssetReference {

        return AssetReference(
            id: id,
            kind: kind,
            relativePath: relativePath,
            mimeType: mimeType,
            createdAt: createdAt,
        )
    }

    static func pdfFixture(
        id: AssetReferenceID = AssetReferenceID(),
        createdAt: Date = .now,
    ) -> AssetReference {
        return fixture(
            id: id,
            kind: .pdf,
            mimeType: "application/pdf",
            createdAt: createdAt
        )
    }

    static func imageFixture(
        id: AssetReferenceID = AssetReferenceID(),
        createdAt: Date = .now,
    ) -> AssetReference {
        return fixture(
            id: id,
            kind: .image,
            mimeType: "image/jpeg",
            createdAt: createdAt
        )
    }

    static func textFixture(
        id: AssetReferenceID = AssetReferenceID(),
        createdAt: Date = .now,
    ) -> AssetReference {

        return fixture(
            id: id,
            kind: .text,
            mimeType: "text/plain",
            createdAt: createdAt
        )
    }
}
