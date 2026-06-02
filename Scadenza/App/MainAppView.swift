//
//  ContentView.swift
//  Scadenza
//
//  Created by Dmytro Ipatii on 25/05/2026.
//

import SwiftUI
import DI

struct MainAppView: View {
    let container: AppContainer

    var body: some View {
        container.makeGreetingView()
        .padding()
    }
}

#Preview {
    MainAppView(container: AppContainer())
}
