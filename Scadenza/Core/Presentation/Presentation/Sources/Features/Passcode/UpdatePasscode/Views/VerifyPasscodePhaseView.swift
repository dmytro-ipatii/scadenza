//
//  VerifyPasscodePhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 31/08/2026.
//

import SwiftUI

public struct VerifyPasscodePhaseView: View {
    @Binding var viewModel: UpdatePasscodeViewModel

    public var body: some View {
        PasscodeScreenView(
            title: "Enter your passcode",
            errorMessage: viewModel.errorMessage,
            maxLength: viewModel.maxPasscodeLength,
            value: $viewModel.passcode,
            onChange: viewModel.processPasscode
        )
    }
}

#Preview {
    VerifyPasscodePhaseView(viewModel: .constant(UpdatePasscodeViewModel()))
}

