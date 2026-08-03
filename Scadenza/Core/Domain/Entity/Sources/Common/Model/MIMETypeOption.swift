//
//  MimeTypeOption.swift
//  Entity
//
//  Created by Dmytro Ipatii on 03/08/2026.
//

public enum MIMETypeOption: String, Codable, Sendable, CaseIterable, Hashable {

    // Images
    case jped = "image/jpeg"
    case png = "image/png"
    case heic = "image/heic"
    case heif = "image/heif"
    case tiff = "image/tiff"

    // Documents
    case pdf = "application/pdf"

    // Manual Input
    case plainText = "text/plain"
}
