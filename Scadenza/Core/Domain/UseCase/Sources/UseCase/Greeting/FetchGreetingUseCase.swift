//
//  FetchGreetingUseCase.swift
//  UseCase
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Repository
import Entity

public protocol FetchGreetingUseCaseProtocol {
    func callAsFunction() async throws -> Greeting
}

public struct FetchGreetingUseCase: Sendable, FetchGreetingUseCaseProtocol {
    private let repository: GreetingRepositoryProtocol

    public init(repository: GreetingRepositoryProtocol) {
        self.repository = repository
    }

    public func callAsFunction() async throws -> Greeting {
        return try await repository.fetchGreeting()
    }

}
