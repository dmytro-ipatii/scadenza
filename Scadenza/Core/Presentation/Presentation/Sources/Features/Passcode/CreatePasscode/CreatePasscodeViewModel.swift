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

    var maxPasscodeLength: Int = 6

    var passcode: String = ""
    var confirmationPasscode: String = ""

    var step: Step = .create

    var errorMessage: String?

    public init() {}

    func appendDigit(_ digit: String) {

        guard !digit.isEmpty, digit.allSatisfy(\.isNumber) else {
            return
        }

        switch step {
        case .create:
            if passcode.count == maxPasscodeLength {
                step = .confirm
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

        step = .completed
    }
}
