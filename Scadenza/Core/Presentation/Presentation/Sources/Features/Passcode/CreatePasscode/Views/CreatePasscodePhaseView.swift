//
//  CreatePasscodePhaseView.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

public struct CreatePasscodePhaseView: View {

    @Bindable var viewModel: CreatePasscodeViewModel

    public var body: some View {
        PasscodeScreenView(
            title: "Enter passcode",
            instructions: "Please enter your pass code with \(viewModel.maxPasscodeLength)-digit pin.",
            maxLength: viewModel.maxPasscodeLength,
            value: $viewModel.passcode,
            onChange: viewModel.appendDigit
        )
    }
}

#Preview {
    CreatePasscodePhaseView(viewModel: CreatePasscodeViewModel())
}
