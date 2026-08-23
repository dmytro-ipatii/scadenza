//
//  DSShimmerEffect.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSShimmerEffect: ViewModifier {

    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    @State private var phase: CGFloat = -1.3

    public func body(content: Content) -> some View {
        if reduceMotion {
            content
        } else {
            content
                .overlay {
                    GeometryReader { proxy in
                        LinearGradient(
                            colors: [.clear, DSColor.surfaceInverse.opacity(0.25), .clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(width: proxy.size.width * 1.4)
                        .offset(x: phase * proxy.size.width)
                    }
                    .mask { content }
                    .allowsHitTesting(false)
                }
                .onAppear {
                    withAnimation(.linear(duration: 1.25).repeatForever(autoreverses: false), ({
                        phase = 1.3
                    }))
                }
        }
    }
}

extension View {

    @ViewBuilder
    func shimmering(active: Bool = true ) -> some View {
        if active {
            modifier(DSShimmerEffect())
        } else { self }
    }
}
