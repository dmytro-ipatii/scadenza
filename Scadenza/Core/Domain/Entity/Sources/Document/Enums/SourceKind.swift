//
//  SourceKind.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

public enum SourceKind: String, Sendable, CaseIterable {
    case camera
    case photoLibrary
    case pdfImport
    case textImport
    case manualInput
}
