//
//  DSCheckMarkView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public struct DSCheckMarkView: View {
    private let state: DSCheckmarkVariant
    private var appearence: DSCheckmarkApearance {
        state.appearance
    }

    public init(state: DSCheckmarkVariant) {
        self.state = state
    }

    public var body: some View {
        ZStack {

            Circle()
                .fill(appearence.background)

            Circle()
                .stroke(appearence.borderColor, style: StrokeStyle(lineWidth: 2))

            switch state {
            case .completed:
                completedStateContentView

            case .inProgress:
                inProgressStateContentView

            case .empty:
                emptyStateContentView
            }
        }
        .frame(width: DSIconSize.lg, height: DSIconSize.lg)
    }

    private var completedStateContentView: some View {
        Image(.check)
            .squareAspectRation()
            .foregroundStyle(DSColor.textInverse)
            .frame(width: DSIconSize.sm)
    }

    private var inProgressStateContentView: some View {
        DSBlinkingDot()
            .frame(width: 10)
    }

    private var emptyStateContentView: some View {
        EmptyView()
    }
}

#Preview("Completed") {
    DSCheckMarkView(state: .completed)
    .padding()
}

#Preview("In Progress") {
    DSCheckMarkView(state: .inProgress)
    .padding()
}

#Preview("Empty") {
    DSCheckMarkView(state: .empty)
    .padding()
}
