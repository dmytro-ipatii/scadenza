//
//  UpdatePasscodeViewModel.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 31/08/2026.
//

import SwiftUI

@MainActor
@Observable
public final class UpdatePasscodeViewModel {

    enum Step {
        case verify
        case update
        case completed
    }

    private let userPasscode: String

    var passcode: String = ""
    var newPasscode: String = ""
    let maxPasscodeLength: Int = PasscodeConstants.maxPasscodeLength
    var errorMessage: String?

    var phase: Step = .verify

    public init() {
        self.userPasscode = "123456"
    }

    func processPasscode(_ codeString: String) {

        guard !codeString.isEmpty, codeString.allSatisfy(\.isNumber) else { return }

        guard codeString.count == maxPasscodeLength else { return }

        switch phase {
        case .verify:

            if codeString == userPasscode {
                phase = .update
            } else {
                errorMessage = "Incorrect passcode"
                passcode = ""
            }

        case .update:
            Task {
                await updatePasscode(with: codeString)
                phase = .completed
            }
        case .completed:
            break
        }
    }

    private func updatePasscode(with passcode: String) async {
        // TODO: Call update passcode here
    }
}
