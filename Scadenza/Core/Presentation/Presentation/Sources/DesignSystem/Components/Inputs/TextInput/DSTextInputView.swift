//
//  DSTextInputView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import SwiftUI

struct DSTextInputView: View {

    @Binding var value: String
    var label: String = ""
    var placeholder: String = ""
    var errorMessage: String?
    var isDisabled: IsDisabled = false

    var body: some View {
        DSFieldView(
            label: label,
            errorMessage: errorMessage,
            isDisabled: isDisabled,
            content: ({
                TextField(
                    placeholder,
                    text: $value
                )
                .disabled(isDisabled)
            })
        )
    }
}

private struct DSTextInputStateView: View {

    @State var value: String = ""

    var body: some View {

        VStack(spacing: 20) {
            DSTextInputView(
                value: $value,
                label: "Titolo",
                placeholder: "Es. Passaporto"
            )

            DSTextInputView(
                value: $value,
                label: "Titolo",
                placeholder: "Es. Passaporto",
                isDisabled: true,
            )

            DSTextInputView(
                value: $value,
                label: "Titolo",
                placeholder: "Es. Passaporto",
                errorMessage: "Seleziona una data valida"
            )
        }

    }
}

#Preview {
    DSTextInputStateView()
        .padding()
}
