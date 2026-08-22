//
//  DSSpinnerView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public struct DSSpinnerView: View {
    private let color: Color

    public init(color: Color = DSColor.accent) {
        self.color = color
    }

    public var body: some View {
        ProgressView()
            .tint(color)
    }
}

#Preview {
    DSSpinnerView()
}
