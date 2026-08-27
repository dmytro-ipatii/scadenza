//
//  AppearanceOptionsView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct AppearanceOptionsView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding private var selection: AppColorScheme
    private let options: [AppColorScheme]

    @State private var localSelection: AppColorScheme

    public init(
        selection: Binding<AppColorScheme>,
        options: [AppColorScheme]
    ) {
        self._selection = selection
        self._localSelection = State(wrappedValue: selection.wrappedValue)
        self.options = options
    }

    public var body: some View {
        DSSheetContentWithActionButtonView(
            title: "Color sheme",
            detennts: [.medium],
            action: applyForm,
            content: ({
                HStack {
                    ForEach(options) { option in
                        let isSelected = option == localSelection

                        VStack {
                            ColorSchemeOptionView(
                                scheme: option,
                                state: isSelected ? .selected : .idle,
                                action: setSelection
                            )

                            DSCheckMarkView(state: isSelected ? .completed : .empty)
                        }
                        .frame(maxWidth: .infinity)
                        .animation(.linear, value: localSelection)

                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }))
    }

    private func setSelection(sheme: AppColorScheme) {
        localSelection = sheme
    }

    private func applyForm() {
        self.selection = localSelection

        dismiss()
    }
}

#Preview {
    AppearanceOptionsView(
        selection: .constant(.dark),
        options: AppColorScheme.allCases
    )
    .padding()
}
