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
    var errorMessage: String?
    var isDisabled: IsDisabled

    public init(
        label: String = "",
        errorMessage: String? = nil,
        isDisabled: IsDisabled = false,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.label = label
        self.errorMessage = errorMessage
        self.isDisabled = isDisabled
    }

    var body: some View {
        VStack {

            if !label.isEmpty {
                labelView(label: label)
            }

            content
                .frame(maxWidth: .infinity)
                .frame(height: DSFieldSize.medium)
                .padding(.horizontal, DSSpace.sm)
                .background(
                    RoundedRectangle(cornerRadius: DSRadius.md)
                        .fill(DSColor.surface)
                        .background(
                            RoundedRectangle(cornerRadius: DSRadius.md)
                                .stroke(style: .init(lineWidth: DSBorderWidth.medium))
                                .fill(DSColor.danger)
                                .opacity(errorMessage != nil ? 1 : 0)
                        )

                )
                .opacity(isDisabled.opacityValue)

            if let errorMessage {
                errorMessagewView(message: errorMessage)
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
            isDisabled: true,
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
            errorMessage: "Inserisci un titolo",
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
