//
//  DSFieldView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import SwiftUI

struct DSFieldView<Content: View>: View {
    var content: Content
    var label: String
    var state: DSFieldState

    private var appearance: DSFieldAppearance {
        .init(from: state)
    }

    public init(
        label: String = "",
        state: DSFieldState = .idle,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.label = label
        self.state = state
    }

    var body: some View {
        VStack {

            if !label.isEmpty {
                labelView(label: label)
            }

            content
                .frame(maxWidth: .infinity)
                .frame(height: appearance.height)
                .padding(.horizontal, appearance.horizontalPaddings)
                .background(
                    RoundedRectangle(cornerRadius: appearance.borderRadius)
                        .fill(appearance.background)
                )
                .overlay(alignment: .center, content: ({
                    ZStack {
                        RoundedRectangle(cornerRadius: appearance.borderRadius)
                            .stroke(
                                appearance.borderColor,
                                style: .init(lineWidth: appearance.borderWidth)
                            )
                            .opacity(appearance.borderOpacity)
                    }
                }))
                .opacity(appearance.opacity)
                .disabled(state.isDisabled)

            if case .error(let message) = state {
                errorMessageView(message: message)
            }
        }
    }

    private func labelView(label: String) -> some View {
        Text(label)
            .fontCaption()
            .fontWeight(.semibold)
            .foregroundStyle(DSColor.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func errorMessageView(message: String) -> some View {
        DSFieldMessageView(
            message: message,
            variant: .error
        )
    }
}

#Preview("Text Field") {
    VStack {
        DSFieldView(
            label: "Titolo",
            content: ({
                TextField(
                    "Es. Passaporto",
                    text: .constant("")
                )
            })
        )

        DSFieldView(
            label: "Titolo",
            state: .focused,
            content: ({
                TextField(
                    "Es. Passaporto",
                    text: .constant("")
                )
            })
        )

        DSFieldView(
            label: "Titolo",
            state: .disabled,
            content: ({
                TextField(
                    "Es. Passaporto",
                    text: .constant("")
                )
                .disabled(true)
            })
        )

        DSFieldView(
            label: "Titolo",
            state: .error(message: "Inserisci un titolo"),
            content: ({
                TextField(
                    "Es. Passaporto",
                    text: .constant("")
                )
            })
        )
    }
    .padding()

}
