//
//  DSLoadableView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSLoadableView<
    ContentView: View,
    PlaceholderView: View,
    ErrorView: View,
    Value: Sendable,
    Error: Sendable
>: View {

    var state: DSLoadState<Value, Error>
    var content: (Value) -> ContentView
    var placeholder: PlaceholderView
    var error: (Error) -> ErrorView

    public init(
        state: DSLoadState<Value, Error>,
        @ViewBuilder content: @escaping (Value) -> ContentView,
        @ViewBuilder placeholder: @escaping () -> PlaceholderView,
        @ViewBuilder error: @escaping (Error) -> ErrorView
    ) {
        self.state = state
        self.content = content
        self.placeholder = placeholder()
        self.error = error
    }

    public var body: some View {
        switch state {
        case .idle, .loading:
            placeholder
        case .loaded(let value):
            content(value)
        case .failed(error: let message):
            error(message)
        }
    }
}

private struct TestStates {
    static let loaded: DSLoadState<String, DSUIError> = .loaded(value: "Hello, World")
    static let loading: DSLoadState<String, DSUIError> = .loading
    static let failed: DSLoadState<String, DSUIError> = .failed(
        error: DSUIError(
            title: "Failed loading data.",
            content: "Please try again."
        )
    )
}

#Preview("Loaded") {
    DSLoadableView(
        state: TestStates.loaded,
        content: { value in
            Text(value)
        },
        placeholder: {
            DSSpinnerView()
        },
        error: { error in
            DSNoticeCard(
                title: error.title,
                content: error.content,
                variant: .danger(icon: .exclamation)
            )
        }
    )
        .padding()
}

#Preview("Loading") {
    DSLoadableView(
        state: TestStates.loading,
        content: { content in
            Text(content)
        },
        placeholder: {
            DSSpinnerView()
        },
        error: { error in
            DSNoticeCard(
                title: error.title,
                content: error.content,
                variant: .danger(icon: .exclamation)
            )
        }
    )
        .padding()
}

#Preview("Error") {
    DSLoadableView(
        state: TestStates.failed,
        content: { content in
            Text(content)
        },
        placeholder: {
            DSSpinnerView()
        },
        error: { error in
            DSNoticeCard(
                title: error.title,
                content: error.content,
                variant: .danger(icon: .exclamation)
            )
        }
    )
        .padding()
}
