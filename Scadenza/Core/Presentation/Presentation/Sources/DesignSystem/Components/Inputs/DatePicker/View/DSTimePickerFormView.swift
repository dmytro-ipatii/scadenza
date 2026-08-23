//
//  DSTimePickerFormView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSTimePickerFormView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding private var selection: Date?
    @State private var localSelection: Date = .now

    public init(
        selection: Binding<Date?>,
    ) {
        self._selection = selection
    }

    public var body: some View {
        VStack(spacing: DSSpace.md) {
            DatePicker(
                "",
                selection: $localSelection,
                displayedComponents: [.hourAndMinute]
            )
            .labelsHidden()
            .datePickerStyle(.wheel)

            DSButtonView(
                label: "Apply",
                variant: .primary,
                action: applyForm
            )
        }
        .onAppear(perform: initializeFromSelection)
    }

    private func initializeFromSelection() {
        localSelection = selection ?? .now
    }

    private func applyForm() {
        selection = localSelection

        dismiss()
    }
}

#Preview {
    DSTimePickerFormView(selection: .constant(.now))
}
