//
//  GreetingView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 02/06/2026.
//

import SwiftUI

public struct GreetingView: View {
    @State private var viewModel: GreetingViewModel

    public init(viewModel: GreetingViewModel) {
        self._viewModel = State(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack {
            switch viewModel.status {
            case .idle, .loading:
                ProgressView()
            case .error(let description):
                Text(description)
                    .font(.headline)
                    .foregroundStyle(.red)
            case .success(let message):
                Text(message)
                    .font(.title)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .onAppear(perform: viewModel.fetchGreeting)
    }
}

//#Preview {
//    GreetingView(
//        viewModel: GreetingViewModel(fetchGreetingUseCase: FetchGreetingUseCase())
//    )
//}
