//
//  DSPickerFieldView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public struct DSPickerFieldView<Option: DSPickerFieldOptionProtocol>: View {

    @Binding private var selection: Option?
    private var options: [Option]

    private var label: String
    private var placeholder: String
    private var icon: ImageResource?

    private var errorMessage: String?
    private var isDisabled: Bool

    public init(
        selection: Binding<Option?>,
        options: [Option],
        label: String = "",
        placeholder: String = "",
        icon: ImageResource? = nil,
        errorMessage: String? = nil,
        isDisabled: Bool = false
    ) {
        self._selection = selection
        self.options = options
        self.label = label
        self.placeholder = placeholder
        self.icon = icon
        self.errorMessage = errorMessage
        self.isDisabled = options.isEmpty || isDisabled
    }

    @State private var isOptionsListPresented: Bool = false
    private var fieldState: DSFieldState { .init(isDisabled: isDisabled, errorMessage: errorMessage)}

    public var body: some View {

        DSFieldView(
            label: label,
            state: fieldState,
            content: ({
                HStack {

                    if let icon {
                        trailingIconView(icon)
                    }

                    contentView(selection?.title ?? placeholder)

                    Spacer()

                    chevronIconView
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .contentShape(.rect)
                .onTapGesture(perform: showOptionsList)
            })
        )
        .sheet(
            isPresented: $isOptionsListPresented,
            content: ({
                DSPickerListView(
                    selection: $selection,
                    title: label,
                    options: options
                )
                .padding(.top, DSSpace.lg)
                .padding(.horizontal, DSSpace.lg)
                .presentationDetents([.medium, .large])
            })
        )
    }

    private func showOptionsList() {
        isOptionsListPresented = true
    }

    private func trailingIconView(_ icon: ImageResource) -> some View {
        Image(icon)
            .inputIcon()
    }

    private func contentView(_ text: String) -> some View {
        Text(text)
            .fontBody()
            .fontWeight(.medium)
            .foregroundStyle(DSColor.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var chevronIconView: some View {
        Image(.chevronDown)
            .inputIcon()
    }
}

#if DEBUG
private let previewLabel: String = "Categoria"
private let previewPlaceholder: String = "Select an option"
private let previewIcon: ImageResource = .umbrella
#endif

private struct DSPickerFieldViewWithStatePreview: View {

    @State var selection: DSPickerFieldPreviewOption?
    private let options: [DSPickerFieldPreviewOption] = DSPickerFieldPreviewOption.allCases

    var body: some View {
        DSPickerFieldView(
            selection: $selection,
            options: options,
            label: previewLabel,
            placeholder: previewPlaceholder,
            icon: previewIcon
        )
    }
}

#Preview("Option selection") {

    DSPickerFieldViewWithStatePreview()
    .padding()
}

#Preview("Errors") {
    DSPickerFieldView(
        selection: .constant(nil),
        options: DSPickerFieldPreviewOption.allCases,
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon,
        errorMessage: "Option is required"
    )
}

#Preview("Disabled") {
    DSPickerFieldView(
        selection: .constant(nil),
        options: DSPickerFieldPreviewOption.allCases,
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon,
        isDisabled: true
    )
    .padding()

}

#Preview("Empty List") {
    DSPickerFieldView(
        selection: .constant(nil as DSPickerFieldPreviewOption?),
        options: [],
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon
    )
    .padding()
}
