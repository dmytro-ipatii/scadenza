//
//  MonetaryAmount.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct MonetaryAmount: Sendable, Hashable {
    public let value: Decimal
    public let currencyCode: String // ISO 4217

    public init(
        value: Decimal,
        currencyCode: String,
    ) {
        self.value = value
        self.currencyCode = currencyCode
    }
}
