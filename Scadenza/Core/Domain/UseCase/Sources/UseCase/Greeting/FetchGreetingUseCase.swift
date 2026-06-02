//
//  FetchGreetingUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Foundation
import Repository
import Entity

public struct FetchGreetingUseCase: Sendable{
    private let repository: GreetingRepositoryProtocol

    public init(repository: GreetingRepositoryProtocol) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> Greeting {
        return try await repository.fetchGreeting()
    }

}
