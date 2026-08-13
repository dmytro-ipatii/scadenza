//
//  DSFieldInputView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 09/08/2026.
//

import SwiftUI

public struct DSNotFocus: Hashable {}

public struct DSFieldInputView<FocusValue: Hashable>: View {

    @Binding var value: String
    var label: String
    var placeholder: String
    var icon: ImageResource?
    var variant: DSInputVariant

    var errorMessage: String?
    var isDisabled: Bool = false

    var submitLabel: SubmitLabel
    var onSubmit: () -> Void

    private var focusValue: FocusValue?
    private var focusState: FocusState<FocusValue?>.Binding?
    @FocusState private var localFocus: Bool

    private var isFocused: Bool {
        if let focusState, let focusValue {
            return focusState.wrappedValue == focusValue
        } else {
            return localFocus
        }
    }

    private var state: DSFieldState {
        .init(isDisabled: isDisabled, isFocused: isFocused, errorMessage: errorMessage)
    }

    public init(
        value: Binding<String>,
        label: String = "",
        placeholder: String = "",
        icon: ImageResource? = nil,
        variant: DSInputVariant,
        errorMessage: String? = nil,
        isDisabled: Bool = false,
        focus: FocusState<FocusValue?>.Binding,
        equals focusValue: FocusValue,
        submitLabel: SubmitLabel = .return,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.icon = icon
        self.variant = variant
        self.errorMessage = errorMessage
        self.submitLabel = submitLabel
        self.isDisabled = isDisabled
        self.focusState = focus
        self.focusValue = focusValue
        self.onSubmit = onSubmit
    }

    public var body: some View {
        DSFieldView(
            label: label,
            state: state,
            content: ({
                HStack {

                    if let icon {
                        iconView(icon: icon)
                    }

                    control
                }
            })
        )
        .onTapGesture {

            guard !isDisabled else { return }

            if let focusState, let focusValue {
                focusState.wrappedValue = focusValue
            } else {
                localFocus = true
            }
        }
    }

    @ViewBuilder private func iconView(icon: ImageResource) -> some View {
        Image(icon)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: DSIconSize.md)
            .foregroundStyle(DSColor.textTertiary)
    }

    @ViewBuilder private var control: some View {
        if let focusState, let focusValue {
            field.focused(focusState, equals: focusValue)
        } else {
            field.focused($localFocus)
        }
    }

    @ViewBuilder private var field: some View {
        TextField(
            placeholder,
            text: $value
        )
        .keyboardType(variant.keyboardType)
        .textContentType(variant.contentType)
        .textInputAutocapitalization(variant.capitalization)
        .autocorrectionDisabled(!variant.autocorrect)
        .focused($localFocus)
        .submitLabel(submitLabel)
        .onSubmit(onSubmit)
    }
}

public extension DSFieldInputView where FocusValue == DSNotFocus {
    init(
        value: Binding<String>,
        label: String = "",
        placeholder: String = "",
        icon: ImageResource? = nil,
        variant: DSInputVariant,
        errorMessage: String? = nil,
        isDisabled: Bool = false,
        submitLabel: SubmitLabel = .return,
        onSubmit: @escaping () -> Void = {}
    ) {
        self.init(
            value: value,
            label: label,
            placeholder: placeholder,
            icon: icon,
            variant: variant,
            errorMessage: errorMessage,
            isDisabled: isDisabled,
            focus: nil,
            equals: nil,
            submitLabel: submitLabel,
            onSubmit: onSubmit
        )
    }
}

extension DSFieldInputView {
    private init(
        value: Binding<String>,
        label: String = "",
        placeholder: String = "",
        icon: ImageResource? = nil,
        variant: DSInputVariant,
        errorMessage: String? = nil,
        isDisabled: Bool = false,
        focus: FocusState<FocusValue?>.Binding?,
        equals: FocusValue?,
        submitLabel: SubmitLabel = .return,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._value = value
        self.label = label
        self.placeholder = placeholder
        self.icon = icon
        self.variant = variant
        self.errorMessage = errorMessage
        self.submitLabel = submitLabel
        self.isDisabled = isDisabled
        self.focusState = focus
        self.focusValue = equals
        self.onSubmit = onSubmit
    }
}

#Preview("Plain text") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Titolo",
            placeholder: "Es. Passaporto",
            variant: .plainText
        )

        DSFieldInputView(
            value: .constant("Passaporto"),
            label: "Titolo",
            placeholder: "Es. Passaporto",
            variant: .plainText
        )
    }
}

#Preview("Email") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Email",
            placeholder: "email address",
            variant: .email
        )

        DSFieldInputView(
            value: .constant("test@email.com"),
            label: "Email",
            placeholder: "email address",
            variant: .email
        )
    }
}

#Preview("Number") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Number",
            placeholder: "number value",
            variant: .number
        )

        DSFieldInputView(
            value: .constant("120"),
            label: "Number",
            placeholder: "number value",
            variant: .number
        )
    }
}

#Preview("Decimal Number") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Decimal Number",
            placeholder: "decimal value",
            variant: .decimalPad
        )

        DSFieldInputView(
            value: .constant("412,00"),
            label: "Decimal Number",
            placeholder: "decimal value",
            variant: .number
        )
    }
}

#Preview("With icon") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Number",
            placeholder: "number value",
            icon: .euro,
            variant: .number
        )
    }
}

#Preview("Disabled") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Titolo",
            placeholder: "Es. Passaporto",
            variant: .plainText,
            isDisabled: true
        )
    }
}

#Preview("Error") {
    Form {
        DSFieldInputView(
            value: .constant(""),
            label: "Titolo",
            placeholder: "Es. Passaporto",
            variant: .plainText,
            errorMessage: "Seleziona una data valida"
        )
    }
}
