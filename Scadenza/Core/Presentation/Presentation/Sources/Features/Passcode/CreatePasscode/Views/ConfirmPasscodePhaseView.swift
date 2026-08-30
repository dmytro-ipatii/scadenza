//
//  ConfirmPasscodePhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct ConfirmPasscodePhaseView: View {

    @Bindable var viewModel: CreatePasscodeViewModel

    public var body: some View {
        PasscodeScreenView(
            title: "Confirm passcode",
            instructions: "Please repeat your passcode.",
            errorMessage: viewModel.errorMessage,
            maxLength: viewModel.maxPasscodeLength,
            value: $viewModel.confirmationPasscode,
            onChange: viewModel.appendDigit
        )
    }
}

#Preview {
    ConfirmPasscodePhaseView(viewModel: CreatePasscodeViewModel())
}
