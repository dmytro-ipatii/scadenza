//
//  View+EXT.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

public extension View {
    func withGlassEfferct(isEnabled: Bool, glass: Glass = .regular) -> some View {
        if isEnabled {
            return AnyView(self.glassEffect(glass))
        } else {
            return AnyView(self)
        }
    }
}
