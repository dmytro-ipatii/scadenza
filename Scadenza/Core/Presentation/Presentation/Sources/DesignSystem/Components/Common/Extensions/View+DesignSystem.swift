//
//  View+DesignSystem.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI

extension View {

    func withGlassEffect(isEnabled: Bool, glass: Glass = .regular) -> some View {
        if isEnabled {
            return AnyView(self.glassEffect(glass))
        } else {
            return AnyView(self)
        }
    }

    func dsScreenContentLayout() -> some View {
        self
            .frame(maxWidth: .infinity)
            .padding(.horizontal, DSSpace.md)
            .frame(maxWidth: .infinity)
    }

    func dsScreenBackground() -> some View {
        background(
            DSColor.background
                .ignoresSafeArea()
        )
    }

    func dsListBackgroud(color: Color = DSColor.surfaceSecondary) -> some View {
        self
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: DSRadius.xl))
    }

}
