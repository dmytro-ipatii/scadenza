//
//  DSDatePickerView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public struct DSDatePickerView: View {
    @Binding var selection: Date?

    let label: String
    let placeholder: String
    let errorMessage: String?
    let isDisabled: Bool

    @State var isDatePickerPresent: Bool = false
    private var fieldState: DSFieldState { .init(isDisabled: isDisabled, errorMessage: errorMessage)}

    private var value: String {

        guard let date = selection else {
            return placeholder
        }

        return date.toLocalDateString()
    }

    public init(
        selection: Binding<Date?>,
        label: String = "",
        placeholder: String = "",
        errorMessage: String? = nil,
        isDisabled: Bool = false
    ) {
        self._selection = selection
        self.label = label
        self.placeholder = placeholder
        self.errorMessage = errorMessage
        self.isDisabled = isDisabled
    }

    public var body: some View {
        DSPickerContentView(
            value: value,
            label: label,
            icon: .calendar,
            fieldState: fieldState,
            onPress: openDatePicker
        )
        .sheet(isPresented: $isDatePickerPresent) {
            DSDatePickerFormView(
                selection: $selection
            )
            .padding(.top, DSSpace.lg)
            .padding(.horizontal, DSSpace.lg)
            .presentationDetents([.medium, .large])
        }
    }

    private func openDatePicker() {
        isDatePickerPresent = true
    }
}

#Preview {

    VStack {
        DSDatePickerView(
            selection: .constant(nil),
            label: "Expiration date",
            placeholder: "Select expiration date"
        )
    }
}
