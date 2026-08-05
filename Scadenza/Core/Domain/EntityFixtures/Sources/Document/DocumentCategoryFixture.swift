//
//  DocumentCategoryFixture.swift
//  EntityFixtures
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

import Entity

public extension DocumentCategory {
    static func fixture(
        kind: DocumentKind,
        documents: [Document]
    ) -> DocumentCategory {
        DocumentCategory(
            kind: kind,
            documents: documents
        )
    }
}
