//
//  SettingsScreenView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

public enum Language: Sendable, CaseIterable {
    case english
    case italian

    var endonym: String {
        switch self {
        case .english:
            "English"
        case .italian:
            "Italiano"
        }
    }
}

extension Language: DSOptionPickerValueProtocol {
    public var title: String {
        self.endonym
    }

    public var id: Self {
        self
    }
}

public struct SettingsScreenView: View {

    @State private var isSelectLanguagePresented: Bool = false
    @State private var isSelectAppearancePresented: Bool = false

    @State var selectedLanguage: Language = .italian
    private let languages: [Language] = Language.allCases

    public init() {}

    public var body: some View {
        NavigationStack {
            DSScreenView {
                VStack(spacing: DSSpace.md) {

                    DSSectionView {
                        VStack {

                            // Appearance
                            DSListRowWithActionView(
                                icon: .moon,
                                title: "Appearance",
                                trialingConent: ({
                                    DSListRowNavigationValueView(value: "Dark")
                                })
                            )

                            // Language
                            DSListRowWithActionView(
                                icon: .globe,
                                title: "Language",
                                trialingConent: ({
                                    DSListRowNavigationValueView(value: selectedLanguage.endonym)
                                }),
                                action: ({
                                    self.isSelectLanguagePresented = true
                                })
                            )
                            .dsOptionPickertSheet(
                                label: "Languages",
                                isPresented: $isSelectLanguagePresented,
                                selection: $selectedLanguage,
                                options: languages
                            )

                            // Face ID & Passcode
                            DSListRowWithActionView(
                                icon: .lock,
                                title: "Face ID & Passcode",
                                trialingConent: ({
                                    DSListRowNavigationValueView(value: "")
                                })
                            )
                                // Set-up password -> form -> show password option when password set-up:
                                // Unlock with Face ID? -> toggle
                                // Change Password -> change password form

                            // Backup encripted iCloud
                            DSListRowWithActionView(
                                icon: .cloud,
                                title: "Sync with iCloud",
                                trialingConent: ({
                                    DSToggleView(isOn: .constant(false))
                                })
                            )

                        }
                        .frame(maxWidth: .infinity)
                        .dsListBackgroud(color: DSColor.surfacePrimary)
                    }

                    Spacer()

                    // Erase data
                    DSButtonView(label: "Erase data", variant: .destructive, action: {})


                }
                .padding(.top, DSSpace.xl)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreenView()
}
