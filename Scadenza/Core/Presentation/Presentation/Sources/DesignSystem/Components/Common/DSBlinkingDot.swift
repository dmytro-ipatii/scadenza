//
//  DSBlinkingDot.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 18/08/2026.
//

import SwiftUI

public struct DSBlinkingDot: View {
    var color: Color = DSColor.success

    @State private var isAnimating: Bool = false

    public var body: some View {
        Circle()
            .fill(color)
            .opacity(isAnimating ? 0.5 : 1)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5).repeatForever()) {
                    isAnimating = true
                }
            }

    }
}
