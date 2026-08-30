//
//  View+Borders.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

extension View {

    func dsBorder(
        color: Color,
        radius: CGFloat,
        borderWidth: CGFloat = 2
    ) -> some View {
        overlay {
            RoundedRectangle(cornerRadius: radius)
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: 2)
                )
        }
    }
}
