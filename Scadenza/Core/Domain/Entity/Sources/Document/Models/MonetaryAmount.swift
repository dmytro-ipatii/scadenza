//
//  MonetaryAmount.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public struct MonetaryAmount: Sendable, Hashable {
    public let value: Decimal
    public let currencyCode: CurrencyCodeOption // ISO 4217

    public init(
        value: Decimal,
        currencyCode: CurrencyCodeOption,
    ) {
        self.value = value
        self.currencyCode = currencyCode
    }
}
