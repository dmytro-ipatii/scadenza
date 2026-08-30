//
//  PasscodeSettingsView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct CreatePasscodeView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: CreatePasscodeViewModel

    public init() {
        self.viewModel = CreatePasscodeViewModel()
    }

    public var body: some View {
        ZStack {
            switch viewModel.step {
            case .create:
                CreatePasscodePhaseView(viewModel: viewModel)
                    .navigationTitle("Create passcode")

            case .confirm:
                ConfirmPasscodePhaseView(viewModel: viewModel)
                    .navigationTitle("Confirm passcode")

            case .completed:
                CompletedPasscodePhaseView(onComplete: ({ dismiss() }))
                    .toolbarVisibility(.hidden, for: .navigationBar)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(
                placement: .topBarTrailing,
                content: ({
                    DSButtonView(
                        label: "Cancel",
                        variant: .textual,
                        action: ({
                            dismiss()
                        })
                    )
                }))
        }
    }

}

#Preview {
    CreatePasscodeView()
}
