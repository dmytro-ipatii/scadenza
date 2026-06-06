//
//  GreetingViewModel.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import Foundation
import Entity
import UseCase

enum GreetingUIStatus: Equatable {
    case idle
    case loading
    case error(description: String)
    case success(message: String)
}

@MainActor @Observable
public final class GreetingViewModel {
    private let fetchGreetingUseCase: FetchGreetingUseCase

    private var task: Task<(), Never>?

    private(set) var status: GreetingUIStatus = .idle

    public init(fetchGreetingUseCase: FetchGreetingUseCase) {
        self.fetchGreetingUseCase = fetchGreetingUseCase
    }

    public func fetchGreeting() {
        task?.cancel()

        task = Task {

            status = .loading

            do {
                let response = try await fetchGreetingUseCase()
                status = .success(message: response.message)
            } catch {
                status = .error(description: error.localizedDescription)
            }

        }
    }

}
