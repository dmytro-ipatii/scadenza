//
//  GreetingRepositoryProtocol.swift
//  Repository
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Foundation
import Entity

public protocol GreetingRepositoryProtocol: Sendable {
    func fetchGreeting() async throws -> Greeting
}
