//
//  SettingsAppearancePickerView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct SettingsAppearancePickerView: View {

    @Binding private var selection: AppColorScheme
    private let options: [AppColorScheme]

    @State private var isOptionsPresent: Bool = false

    init(
        selection: Binding<AppColorScheme>,
        options: [AppColorScheme]
    ) {
        self._selection = selection
        self.options = options
    }

    public var body: some View {
        DSListRowWithActionView(
            icon: .moon,
            title: "Appearance",
            trialingConent: ({
                DSListRowNavigationValueView(value: selection.title)
            }),
            action: showAppearanceOptions
        )
        .dsSheet(
            isPresented: $isOptionsPresent,
            content: ({
                ColorSchemeOptionsView(
                    selection: $selection,
                    options: options
                )
            }))
    }

    private func showAppearanceOptions() {
        isOptionsPresent = true
    }
}

#Preview {
    SettingsAppearancePickerView(
        selection: .constant(.light),
        options: AppColorScheme.allCases
    )
}
