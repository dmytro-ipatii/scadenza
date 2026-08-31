//
//  SetNewPasscodePhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 31/08/2026.
//

import SwiftUI

public struct SetNewPasscodePhaseView: View {
    @Binding var viewModel: UpdatePasscodeViewModel

    public var body: some View {
        PasscodeScreenView(
            title: "Enter your new passcode",
            maxLength: viewModel.maxPasscodeLength,
            value: $viewModel.newPasscode,
            onChange: viewModel.processPasscode
        )
    }
}

#Preview {
    SetNewPasscodePhaseView(viewModel: .constant(UpdatePasscodeViewModel()))
}
