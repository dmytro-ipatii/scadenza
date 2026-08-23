//
//  AppContainer.swift
//  DI
//
//  Created by Dmytro Ipatii on 02/06/2026.
//
import SwiftUI

import Foundation
import DataSource
import Entity
import Repository
import UseCase
import Presentation
import DataSourceMocks

@MainActor
public final class AppContainer {
    public let modalManager: ModalManager

    public init() {
        modalManager = ModalManager()
    }

    public func createInoxView() -> some View {

        let persistanceRepository = InMemoryDocumentPersistenceRepository(documents: [])
        let loadInboxUseCase = LoadInboxUseCase(persistence: persistanceRepository)
        let viewModel = InboxViewModel(loadInbox: loadInboxUseCase)

        return InboxView(viewModel: viewModel)
    }
}
