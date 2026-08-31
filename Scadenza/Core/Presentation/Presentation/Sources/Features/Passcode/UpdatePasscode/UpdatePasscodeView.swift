//
//  UpdatePasscodeView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 31/08/2026.
//

import SwiftUI



public struct UpdatePasscodeView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var viewModel: UpdatePasscodeViewModel

    public init() {
        self.viewModel = UpdatePasscodeViewModel()
    }

    public var body: some View {
        ZStack {
            switch viewModel.phase {
            case .verify:
                VerifyPasscodePhaseView(viewModel: $viewModel)

            case .update:
                SetNewPasscodePhaseView(viewModel: $viewModel)

            case .completed:
                CompletedNewPasscodeCreationPhaseView(onComplete: ({ dismiss() }))
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
    UpdatePasscodeView()
}
