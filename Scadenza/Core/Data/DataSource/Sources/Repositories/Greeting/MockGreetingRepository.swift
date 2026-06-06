//
//  File.swift
//  DataSource
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Foundation
import Repository
import Entity

public struct MockGreetingRepository: Sendable, GreetingRepositoryProtocol {

    public init() {

    }

    public func fetchGreeting() async throws -> Greeting {
        try await Task.sleep(for: .seconds(2))

        return Greeting(message: "Hello, World!")
    }

}
