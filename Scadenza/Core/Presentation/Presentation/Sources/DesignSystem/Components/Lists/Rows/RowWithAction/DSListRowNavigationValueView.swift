//
//  DSListRowNavigationValueView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

public struct DSListRowNavigationValueView: View {
    private let value: String

    public init(value: String) {
        self.value = value
    }

    public var body: some View {
        HStack {
            Text(value)
                .fontSecondary()
                .foregroundStyle(DSColor.textSecondary)
                .fontWeight(.medium)

            Image(.chevronRight)
                .squareAspectRation()
                .frame(height: DSIconSize.md)
                .foregroundStyle(DSColor.textQuaternary)
        }
    }
}

#Preview{
    DSListRowNavigationValueView(value: "Dark")
        .padding()
}
