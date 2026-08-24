//
//  SettingsScreenView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 24/08/2026.
//

import SwiftUI


struct SettingsScreenView: View {
    var body: some View {
        DSSrollableScreenView {
            VStack(spacing: DSSpace.md) {

                DSSectionView(
                    title: "General",
                    content: {
                        VStack{

                            Text("Hello")
                        }
                        .frame(maxWidth: .infinity)
                        .dsListBackgroud(color: DSColor.surfacePrimary)
                    })

            }
            .padding(.top, DSSpace.xl)
        }
        .navigationTitle("Setting")
    }
}

#Preview {
    NavigationStack {
        SettingsScreenView()
    }

}
