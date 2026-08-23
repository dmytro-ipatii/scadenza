//
//  DSModalManager.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 23/08/2026.
//

import SwiftUI

@MainActor
@Observable
public class ModalManager {
    var content: ModalContent?

    public init() {
    }

    func present(content: ModalContent?) {
        self.content = content
    }

    func dismiss() {
        self.content = nil
    }
}
