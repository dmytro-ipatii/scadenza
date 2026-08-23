//
//  SwiftUIView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSOptionPickerListView<Option: DSOptionPickerOptionValueProtocol>: View {

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

    public var body: some View {
        VStack(spacing: DSSpace.md) {
            if let title {
                titleView(title)
            }

            DSListView(
                selection: $localSelection,
                items: options,
                onItemPress: selectOption,
                listItem: optionRowView
            )

            applyButtonView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
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

    private func titleView(_ title: String) -> some View {
        Text(title)
            .foregroundStyle(DSColor.textPrimary)
            .fontTitle()
            .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var applyButtonView: some View {
        DSButtonView(
            label: "Apply",
            variant: .primary,
            action: (applySelection)
        )
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
    DSOptionPickerListView(
        selection: .constant(nil),
        title: "Title",
        options: DSOptionPickerFieldPreviewOption.allCases
    )
    .padding()
}

#Preview("Selected") {
    DSOptionPickerListView(
        selection: .constant(DSOptionPickerFieldPreviewOption.optionOne),
        title: "Title",
        options: DSOptionPickerFieldPreviewOption.allCases
    )
    .padding()
}
