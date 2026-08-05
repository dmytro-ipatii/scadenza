//
//  DocumentCategoryScenario.swift
//  EntityFixtures
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

import Foundation
import Entity

public enum DocumentCategoryScenario {

    /// Many docs spread across kinds and dates — list/scroll performance.
    public static func many() -> [DocumentCategory] {
        let documents = DocumentScenario.many()

        return DocumentKind.allCases.map { docKind in
            return DocumentCategory.fixture(
                kind: docKind,
                documents: documents.filter { $0.kind == docKind }
            )
        }
    }

    public static var complete: [DocumentCategory] {
        Self.many().filter { !$0.documents.isEmpty }
    }

}
