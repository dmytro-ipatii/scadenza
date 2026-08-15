//
//  Image+EXT.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public extension Image {

    func squareAspectRation() -> some View {
        self.resizable()
            .aspectRatio(1, contentMode: .fit)

    }

    func inputIcon(size: CGFloat = DSIconSize.md) -> some View {
        self
            .squareAspectRation()
            .frame(width: size, height: size)
            .foregroundStyle(DSColor.textTertiary)
    }
}
