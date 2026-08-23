//
//  DSInputVariant.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 13/08/2026.
//

import SwiftUI

public struct DSInputVariant: Sendable {
    var keyboardType: UIKeyboardType = .default
    var contentType: UITextContentType?
    var capitalization: TextInputAutocapitalization? = .sentences
    var autocorrect: Bool = true

    public static let plainText: DSInputVariant = .init()

    public static let email: DSInputVariant = .init(
        keyboardType: .emailAddress,
        contentType: .emailAddress,
        capitalization: .never,
        autocorrect: false
    )

    public static let number: DSInputVariant = .init(
        keyboardType: .numberPad,
        contentType: .flightNumber,
        capitalization: .never,
        autocorrect: false
    )

    public static let decimalPad: DSInputVariant = .init(
        keyboardType: .decimalPad,
        contentType: .flightNumber,
        capitalization: .never,
        autocorrect: false
    )
}
