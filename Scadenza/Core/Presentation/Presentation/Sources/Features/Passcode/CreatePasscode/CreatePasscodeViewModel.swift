//
//  CreatePasscodeViewModel.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 30/08/2026.
//

import SwiftUI

@MainActor
@Observable
public final class CreatePasscodeViewModel {

    public enum Step {
        case create
        case confirm
        case completed
    }

    var maxPasscodeLength: Int = PasscodeConstants.maxPasscodeLength

    var passcode: String = ""
    var confirmationPasscode: String = ""

    var phase: Step = .create

    var errorMessage: String?

    public init() {}

    func processPasscode(_ codeString: String) {

        guard !codeString.isEmpty, codeString.allSatisfy(\.isNumber) else {
            return
        }

        switch phase {
        case .create:
            if passcode.count == maxPasscodeLength {
                phase = .confirm
            }

        case .confirm:

            if confirmationPasscode.count == maxPasscodeLength {
                confirmPasscode()
            }

        case .completed:
            break
        }

    }

    private func confirmPasscode() {

        guard passcode == confirmationPasscode else {
            errorMessage = "Passcodes do not match"
            confirmationPasscode = ""
            return
        }

        phase = .completed
    }
}
