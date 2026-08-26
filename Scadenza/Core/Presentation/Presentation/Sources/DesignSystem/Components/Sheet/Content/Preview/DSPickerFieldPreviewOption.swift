//
//  DSOptionPickerFieldPreviewOption.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

#if DEBUG
import SwiftUI

public enum DSOptionPickerFieldPreviewOption: String, CaseIterable, DSOptionPickerValueProtocol {
    public var title: String {
        self.rawValue.uppercased()
    }

    public var id: Self {
        self
    }

    case optionOne
    case optionTwo
    case optionThree
    case optionFour
    case optionFive
    case optionSix
    case optionSeven
    case optionEight
    case optionNine
    case optionTen
}

#endif
