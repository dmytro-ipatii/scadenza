//
//  Typography.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 05/08/2026.
//

import Foundation
import SwiftUI

public extension Text {

    func fontDisplay() -> some View {
        self.font(.system(size: 40, weight: .bold))
    }

    func fontTitleLarge() -> some View {
        self.font(.system(size: 34, weight: .bold))
    }

    func fontTitle() -> some View {
        self.font(.system(size: 28, weight: .bold))
    }

    func fontSection() -> some View {
        self.font(.system(size: 22, weight: .bold))
    }

    func fontHeadline() -> some View {
        self.font(.system(size: 18, weight: .semibold))
    }

    func fontBody() -> some View {
        self.font(.system(size: 16, weight: .regular))
    }

    func fontSecondary() -> some View {
        self.font(.system(size: 14, weight: .regular))
    }

    func fontCaption() -> some View {
        self.font(.system(size: 12, weight: .regular))
    }

    func fontEyebrow() -> some View {
        self.font(.system(size: 11, weight: .semibold))
    }

}

#Preview {

    VStack(alignment: .leading) {

        Group {

            Section("Display") {
                Text("Ogni scadenza al suo posto")
                    .fontDisplay()
            }

            Section("Large Title") {
                Text("Buongiorno, Marco")
                    .fontTitleLarge()
            }

            Section("Title") {
                Text("RC Auto · Fiat Panda")
                    .fontTitle()
            }

            Section("Section") {
                Text("In scadenza")
                    .fontSection()
            }

            Section("Headline") {
                Text("Passaporto")
                    .fontHeadline()
            }

            Section("Body") {
                Text("Data di scadenza · 14 maggio 2026")
                    .fontBody()
            }

            Section("Secondary") {
                Text("Allianz · polizza IT-4429-88112")
                    .fontSecondary()
            }

            Section("Caption") {
                Text("Scade tra 4 giorni · €412,00")
                    .fontCaption()
            }

            Section("Eyebrow") {
                Text("Giorni alla scadenza")
                    .fontEyebrow()

            }

        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .padding()
}
