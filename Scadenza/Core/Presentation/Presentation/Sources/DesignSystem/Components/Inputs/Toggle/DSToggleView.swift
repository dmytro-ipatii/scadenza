//
//  DSToggleView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 16/08/2026.
//

import SwiftUI

struct DSToggleView: View {

    @Binding var isOn: Bool

    var body: some View {
        Toggle("", isOn: $isOn)
            .labelsHidden()
    }
}

#Preview {
    VStack {
        DSToggleView(isOn: .constant(true))
        DSToggleView(isOn: .constant(false))
    }
}
