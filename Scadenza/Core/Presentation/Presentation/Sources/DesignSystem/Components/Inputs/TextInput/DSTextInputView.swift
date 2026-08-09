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
    var state: DSFieldState = .idle
    var onTap: () -> Void = {}
    var onSubmit: () -> Void = {}

    var body: some View {
        DSFieldView(
            label: label,
            state: state,
            onTap: onTap,
            content: ({
                TextField(
                    placeholder,
                    text: $value
                )
                .onSubmit(onSubmit)

            })
        )
    }
}

#Preview("Idle") {
    DSTextInputView(
        value: .constant(""),
        label: "Titolo",
        placeholder: "Es. Passaporto"
    )
    .padding()
}

#Preview("Focused") {
    DSTextInputView(
        value: .constant(""),
        label: "Titolo",
        placeholder: "Es. Passaporto",
        state: .focused
    )
    .padding()
}

#Preview("Disabled") {
    DSTextInputView(
        value: .constant(""),
        label: "Titolo",
        placeholder: "Es. Passaporto",
        state: .disabled
    )
    .padding()
}

#Preview("Error") {
    DSTextInputView(
        value: .constant(""),
        label: "Titolo",
        placeholder: "Es. Passaporto",
        state: .error(message: "Seleziona una data valida")
    )
    .padding()
}
