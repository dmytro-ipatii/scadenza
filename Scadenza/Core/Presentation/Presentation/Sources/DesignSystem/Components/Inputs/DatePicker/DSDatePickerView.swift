//
//  DSDatePickerView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

public enum DSDatePickerVariant {
    case date
    case time

    var icon: ImageResource {
        switch self {
        case .date:
                .calendar
        case .time:
                .clock
        }
    }

    func getFormatedDate(_ date: Date) -> String {
        switch self {
        case .date:
            date.toLocalDateString()
        case .time:
            date.toLocalTimeString()
        }
    }

    @MainActor @ViewBuilder func pickerForm(_ selection: Binding<Date?>) -> some View {
        switch self {
        case .date:
            DSDatePickerFormView(
                selection: selection
            )
        case .time:
            DSTimePickerFormView(
                selection: selection
            )
        }

    }
}

public struct DSDatePickerView: View {
    @Binding var selection: Date?

    let variant: DSDatePickerVariant
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

        return variant.getFormatedDate(date)
    }

    public init(
        selection: Binding<Date?>,
        variant: DSDatePickerVariant,
        label: String = "",
        placeholder: String = "",
        errorMessage: String? = nil,
        isDisabled: Bool = false
    ) {
        self._selection = selection
        self.variant = variant
        self.label = label
        self.placeholder = placeholder
        self.errorMessage = errorMessage
        self.isDisabled = isDisabled
    }

    public var body: some View {
        DSPickerContentView(
            value: value,
            label: label,
            icon: variant.icon,
            fieldState: fieldState,
            onPress: openDatePicker
        )
        .sheet(isPresented: $isDatePickerPresent) {
            variant.pickerForm($selection)
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
            variant: .date,
            label: "Expiration date",
            placeholder: "Date"
        )

        DSDatePickerView(
            selection: .constant(nil),
            variant: .time,
            label: "Expiration time",
            placeholder: "Time"
        )
    }
}
