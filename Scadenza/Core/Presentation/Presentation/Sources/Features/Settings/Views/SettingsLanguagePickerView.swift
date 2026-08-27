//
//  SettingsLanguagePickerView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 27/08/2026.
//

import SwiftUI

public struct SettingsLanguagePickerView: View {

    @Binding private var selection: AppLanguage
    private let languages: [AppLanguage]

    @State private var isSelectLanguagePresented: Bool = false

    public init(
        selection: Binding<AppLanguage>,
        languages: [AppLanguage]
    ) {
        self._selection = selection
        self.languages = languages
    }

    public var body: some View {
        DSListRowWithActionView(
            icon: .globe,
            title: "Languages",
            trialingConent: ({
                DSListRowNavigationValueView(value: selection.endonym)
            }),
            action: openLanguageOptions
        )
        .dsOptionPickertSheet(
            label: "Change language",
            isPresented: $isSelectLanguagePresented,
            selection: $selection,
            options: languages
        )
    }

    private func openLanguageOptions() {
        isSelectLanguagePresented = true
    }
}

#Preview {
    SettingsLanguagePickerView(
        selection: .constant(.italian),
        languages: AppLanguage.allCases
    )
}
