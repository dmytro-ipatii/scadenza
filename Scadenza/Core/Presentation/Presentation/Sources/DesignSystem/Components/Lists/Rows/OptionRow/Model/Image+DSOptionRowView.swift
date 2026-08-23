//
//  Image+DSOptionRowView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import SwiftUI

extension Image {
    func optionRowIcon(color: Color) -> some View {
        self.squareAspectRation()
            .frame(width: 20, height: 20)
            .foregroundStyle(color)
    }
}
