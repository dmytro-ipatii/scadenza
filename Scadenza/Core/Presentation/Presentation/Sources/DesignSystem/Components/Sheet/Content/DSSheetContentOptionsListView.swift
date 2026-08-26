//
//  DSSheetContentOptionsListView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSSheetContentOptionsListView<Option: DSOptionPickerValueProtocol>: View {

    @Environment(\.dismiss) private var dismiss

    @Binding private var selection: Option?
    private var title: String?
    private var options: [Option]

    @State private var localSelection: Option?

    public init(
        selection: Binding<Option?>,
        title: String? = nil,
        options: [Option]
    ) {
        self._selection = selection
        self.title = title
        self.options = options
    }

    public init(
        selection: Binding<Option>,
        title: String? = nil,
        options: [Option]
    ) {
        self._selection = Binding(asOptional: selection)

        self.title = title
        self.options = options
    }

    public var body: some View {
        DSSheetContentWithActionButtonView(
            title: title,
            detennts: [.medium, .large],
            action: applySelection,
            content: ({
                DSListView(
                    selection: $localSelection,
                    items: options,
                    onItemPress: selectOption,
                    listItem: optionRowView
                )
            })
        )
        .onAppear(perform: initializeSelection)
    }

    private func initializeSelection() {
        localSelection = selection
    }

    private func isSelected(_ option: Option) -> Bool {
         option == localSelection
    }

    private func selectOption(_ option: Option) {
        localSelection = option
    }

    private func applySelection() {
        selection = localSelection

        dismiss()
    }

    private func optionRowView(_ option: Option) -> AnyView {
        let appearance: DSOptionPickerListRowAppearance = isSelected(option) ? .selected : .plain

        return AnyView(
            DSOptionRowView(
                trailingIconConfigs: appearance.icon,
                content: ({
                    Text(option.title)
                        .fontBody()
                        .foregroundStyle(appearance.foreground)
                        .fontWeight(appearance.fontWeight)
                })
            )
        )
    }
}

#Preview("Plain") {
    DSSheetContentOptionsListView(
        selection: .constant(nil),
        title: "Title",
        options: DSOptionPickerFieldPreviewOption.allCases
    )
    .padding()
}

#Preview("Selected") {
    DSSheetContentOptionsListView(
        selection: .constant(DSOptionPickerFieldPreviewOption.optionOne),
        title: "Title",
        options: DSOptionPickerFieldPreviewOption.allCases
    )
    .padding()
}
