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
            DSSrollableScreenView {
                VStack(spacing: DSSpace.md) {

                    DSSectionView(title: "General") {
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



                        }
                        .frame(maxWidth: .infinity)
                        .dsListBackgroud(color: DSColor.surfacePrimary)
                    }

                    DSSectionView(
                        title: "Data",
                        content: ({
                            VStack {
                                DSNoticeCard(
                                    title: "All your data stay private.",
                                    content: "No document, image or text is ever sent elsewhere.",
                                    variant: .custom(
                                        icon: .shieldCheck,
                                        iconColor: DSColor.success,
                                        foreground: DSColor.textPrimary,
                                        background: DSColor.surfaceSecondary
                                    )
                                )

                                VStack {

                                    // Backup encripted iCloud
                                    DSListRowWithActionView(
                                        icon: .cloud,
                                        title: "Sync with iCloud",
                                        trialingConent: ({
                                            DSToggleView(isOn: $isSyncWithCloudAllowed)
                                        })
                                    )

                                    DSListRowWithActionView(
                                        icon: .trash,
                                        title: "Delete all data",
                                        primaryColor: DSColor.danger,
                                        trialingConent: {
                                            DSListRowNavigationValueView(value: "")
                                        },
                                        action: ({})
                                    )
                                }
                                .frame(maxWidth: .infinity)
                                .dsListBackgroud(color: DSColor.surfacePrimary)
                            }
                    }))

                }
                .padding(.top, DSSpace.xl)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsScreenView()
}
