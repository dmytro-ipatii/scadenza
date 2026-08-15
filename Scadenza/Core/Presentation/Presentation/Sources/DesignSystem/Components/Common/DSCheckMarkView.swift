//
//  DSCheckMarkView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public struct DSCheckMarkView: View {
    let isActive: Bool

    public init(isActive: Bool) {
        self.isActive = isActive
    }

    public var body: some View {
        ZStack {
            Circle()
                .fill(isActive ? DSColor.success : DSColor.surfaceElevation)

            if isActive {
                Image(.check)
                    .squareAspectRation()
                    .foregroundStyle(DSColor.textInverse)
                    .frame(width: DSIconSize.sm)
            }
        }
        .frame(width: DSIconSize.lg, height: DSIconSize.lg)
    }
}

#Preview("Active") {
    DSCheckMarkView(
        isActive: true
    )
    .padding()
}

#Preview("Inactive") {
    DSCheckMarkView(
        isActive: false
    )
    .padding()
}
