//
//  SettingsScreenView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

// TODO: Move this models to the entity layer
public enum AppColorScheme: Sendable {
    case light
    case dark

    static var `default`: Self {
        // TODO: Set default value from the user device's colot scheme
        .dark
    }
}

extension AppColorScheme: CaseIterable, DSOptionPickerValueProtocol {
    public var id: Self {
        self
    }

    public var title: String {
        switch self {
        case .light:
            "Light"
        case .dark:
            "Dark"
        }
    }

    var colorScheme: ColorScheme {
        switch self {
        case .light:
                .light
        case .dark:
                .dark
        }
    }
}

public enum AppLanguage: Sendable {
    case english
    case italian
}

extension AppLanguage: DSOptionPickerValueProtocol, CaseIterable{
    var endonym: String {
        switch self {
        case .english:
            "English"
        case .italian:
            "Italiano"
        }
    }

    public var title: String {
        self.endonym
    }

    public var id: Self {
        self
    }
}

public struct SettingsScreenView: View {

    @State private var selectedColorScheme: AppColorScheme = AppColorScheme.default
    private let colorSchemeOptions: [AppColorScheme] = AppColorScheme.allCases

    @State private var selectedLanguage: AppLanguage = .italian
    private let languages: [AppLanguage] = AppLanguage.allCases

    @State private var isSyncWithCloudAllowed: Bool = false

    public init() {}

    public var body: some View {
        NavigationStack {
            DSScreenView {
                VStack(spacing: DSSpace.md) {

                    DSSectionView {
                        VStack {

                            // Appearance
                            SettingsAppearancePickerView(
                                selection: $selectedColorScheme,
                                options: colorSchemeOptions
                            )

                            // Language
                            SettingsLanguagePickerView(
                                selection: $selectedLanguage,
                                languages: languages
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
                                    DSToggleView(isOn: $isSyncWithCloudAllowed)
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
