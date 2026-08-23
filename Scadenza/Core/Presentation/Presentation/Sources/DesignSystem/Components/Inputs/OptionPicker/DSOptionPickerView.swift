//
//  DSPickerFieldView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public struct DSOptionPickerView<Option: DSOptionPickerOptionValueProtocol>: View {

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
        DSPickerContentView(
            value: selection?.title ?? placeholder,
            label: label,
            icon: icon,
            fieldState: fieldState,
            onPress: showOptionsList
        )
        .sheet(
            isPresented: $isOptionsListPresented,
            content: ({
                DSOptionPickerListView(
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
}

#if DEBUG
private let previewLabel: String = "Categoria"
private let previewPlaceholder: String = "Select an option"
private let previewIcon: ImageResource = .umbrella
#endif

private struct DSPickerFieldViewWithStatePreview: View {

    @State var selection: DSOptionPickerFieldPreviewOption?
    private let options: [DSOptionPickerFieldPreviewOption] = DSOptionPickerFieldPreviewOption.allCases

    var body: some View {
        DSOptionPickerView(
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
    DSOptionPickerView(
        selection: .constant(nil),
        options: DSOptionPickerFieldPreviewOption.allCases,
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon,
        errorMessage: "Option is required"
    )
}

#Preview("Disabled") {
    DSOptionPickerView(
        selection: .constant(nil),
        options: DSOptionPickerFieldPreviewOption.allCases,
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon,
        isDisabled: true
    )
    .padding()

}

#Preview("Empty List") {
    DSOptionPickerView(
        selection: .constant(nil as DSOptionPickerFieldPreviewOption?),
        options: [],
        label: previewLabel,
        placeholder: previewPlaceholder,
        icon: previewIcon
    )
    .padding()
}
