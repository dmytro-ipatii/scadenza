//
//  PreviewLoadInboxUseCase.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

#if DEBUG
import Entity
import UseCase

struct PreviewLoadInboxUseCase: LoadInboxUseCaseProtocol, Sendable {

    enum Outcome {
        case loaded(documents: [DocumentCategory])
        case failed(PersistenceError)
    }

    let outcome: Outcome
    let delay: Double

    public init(outcome: Outcome, delay: Double = 1.0) {
        self.outcome = outcome
        self.delay = delay
    }

    public func callAsFunction() async throws(PersistenceError) -> [DocumentCategory] {
        try? await Task.sleep(for: .seconds(delay))

        switch outcome {
        case .loaded(documents: let documents): return documents
        case .failed(let error): throw error
        }
    }

}

#endif
