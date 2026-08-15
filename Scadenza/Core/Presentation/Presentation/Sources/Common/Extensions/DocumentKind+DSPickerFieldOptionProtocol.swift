//
//  DocumentKind+DSPickerFieldOptionProtocol.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import Entity

extension DocumentKind: @retroactive Identifiable {}
extension DocumentKind: DSPickerFieldOptionProtocol {

    public var title: String {
        self.localizedString
    }

    public var id: Self {
        self
    }

}
