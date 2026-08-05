//
//  DocumentsInboxView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 04/08/2026.
//

import SwiftUI
import EntityFixtures

public struct InboxView: View {

    @State private var viewModel: InboxViewModel

    public init(viewModel: InboxViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }

    public var body: some View {

        ZStack {

            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded(documents: let documents):
                Text("Documents count: \(documents.count)")
            case .error(message: let errorMessage):
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
        }
        .task {
            await viewModel.loadDocuments()
        }
    }
}

#Preview("Load all data") {
    InboxView(viewModel: .preview(outcome: .loaded(documents: DocumentCategoryScenario.complete)))
}

#Preview("Error loading data") {
    InboxView(viewModel: .preview(outcome: .failed(.notFound)))
}
