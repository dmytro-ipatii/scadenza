//
//  Greeting.swift
//  Entity
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Foundation

public struct Greeting: Sendable {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}
