//
//  ExtractionEvent.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public enum ExtractionEvent: Sendable {
    case partial(PartialExtractedDocument)
    case complete(ExtractedFields)

}
