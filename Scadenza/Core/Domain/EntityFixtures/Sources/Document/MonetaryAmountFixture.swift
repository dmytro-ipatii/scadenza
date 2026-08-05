//
//  MonetaryAmountFixture.swift
//  DataSourceMocks
//
//  Created by Dmytro Ipatii on 22/06/2026.
//

import Foundation
import Entity

public extension MonetaryAmount {

    static func fixture(
        value: Decimal = 0.0,
        currencyCode: CurrencyCodeOption = .eur
    ) -> MonetaryAmount {
        return MonetaryAmount(
            value: value,
            currencyCode: currencyCode,
        )
    }
}
