//
//  ScadenzaApp.swift
//  Scadenza
//
//  Created by Dmytro Ipatii on 25/05/2026.
//

import SwiftUI
import DI

@main
struct MainApp: App {
    private let container = AppContainer()

    var body: some Scene {
        WindowGroup {
            MainAppView(container: container)
        }
    }
}
