//
//  MIMETypeOption+EXT.swift
//  Entity
//
//  Created by Dmytro Ipatii on 03/08/2026.
//

public extension MIMETypeOption {

    var isImage: Bool {
        rawValue.hasPrefix("image/")
    }

    var fileExtension: String {
        switch self {
        case .jped: "jped"
        case .png: "png"
        case .heic: "heic"
        case .heif: "heif"
        case .tiff: "tiff"
        case .pdf: "pdf"
        case .plainText: "txt"
        }
    }
}
