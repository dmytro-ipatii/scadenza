//
//  InboxViewModel.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

import Foundation
import Entity
import UseCase

@MainActor
@Observable
public final class InboxViewModel {

    public enum State: Equatable {
        case loading
        case loaded(documents: [DocumentCategory])
        case error(message: String)
    }

    private let loadInbox: LoadInboxUseCaseProtocol

    private(set) var state: State = .loading

    public init(loadInbox: LoadInboxUseCaseProtocol) {
        self.loadInbox = loadInbox
    }

    func loadDocuments() async {

        do {

            let documents = try await loadInbox()
            self.state = .loaded(documents: documents)

        } catch {
            self.state = .error(message: error.localizedDescription)
        }
    }
}
