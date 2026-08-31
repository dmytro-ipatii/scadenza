//
//  PasscodeScreenView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct PasscodeScreenView: View {
    private let title: String
    private let instructions: String?
    private let errorMessage: String?
    private let maxLength: Int
    @Binding private var value: String
    private let onChange: (String) -> Void

    public init(
        title: String,
        instructions: String? = nil,
        errorMessage: String? = nil,
        maxLength: Int,
        value: Binding<String>,
        onChange: @escaping (String) -> Void
    ) {
        self.title = title
        self.instructions = instructions
        self.errorMessage = errorMessage
        self.maxLength = maxLength
        self._value = value
        self.onChange = onChange
    }

    public var body: some View {
        VStack(spacing: DSSpace.lg) {

            titleView

            if let instructions {
                instructionsView(instructions)
            }

            passcodeInputView

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var titleView: some View {
        Text(title)
            .fontTitle()
            .fontWeight(.bold)
            .foregroundStyle(DSColor.textPrimary)
    }

    private func instructionsView(_ text: String) -> some View {
        Text(text)
            .fontBody()
            .foregroundStyle(DSColor.textSecondary)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 350)
    }

    private var passcodeInputView: some View {
        VStack(alignment: .center, spacing: DSSpace.md) {
            DSPasscodeInputView(
                value: $value,
                maxLength: maxLength,
                onChange: onChange
            )

            if let errorMessage {
                DSFieldMessageView(
                    message: errorMessage,
                    variant: .error,
                    alignemnt: .center
                )
            }

        }

    }
}

#Preview("Preview") {
    PasscodeScreenView(
        title: "Enter passcode",
        instructions: "Please enter your \(6)-digit pin to securelly access your data.",
        maxLength: 6,
        value: .constant("123"),
        onChange: { _ in }
    )
}

#Preview("With error message") {
    PasscodeScreenView(
        title: "Enter passcode",
        instructions: "Please enter your \(6)-digit pin to securelly access your data.",
        errorMessage: "Incorrect passcode",
        maxLength: 6,
        value: .constant("123456"),
        onChange: { _ in }
    )
}
