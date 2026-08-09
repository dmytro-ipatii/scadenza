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
    var onTap: () -> Void

    private var appearance: DSFieldAppearance {
        .init(from: state)
    }

    public init(
        label: String = "",
        state: DSFieldState = .idle,
        onTap: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.label = label
        self.state = state
        self.onTap = onTap
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
                        .background(
                            RoundedRectangle(cornerRadius: appearance.borderRadius)
                                .stroke(style: .init(lineWidth: appearance.borderWidth))
                                .fill(appearance.borderColor)
                                .opacity(appearance.borderOpacity)
                        )
                )
                .opacity(appearance.opacity)
                .disabled(state.isDisabled)
                .onTapGesture(perform: onTap)

            if case .error(let message) = state {
                errorMessagewView(message: message)
            }
        }
    }

    @ViewBuilder private func labelView(label: String) -> some View {
        Text(label)
            .fontCaption()
            .fontWeight(.semibold)
            .foregroundStyle(DSColor.textSecondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    @ViewBuilder private func errorMessagewView(message: String) -> some View {
        HStack(spacing: DSSpace.xxxs) {
            Image(.exclamation)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .frame(width: DSIconSize.xs)

            Text(message)
                .fontCaption()
                .fontWeight(.semibold)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundStyle(DSColor.danger)
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
