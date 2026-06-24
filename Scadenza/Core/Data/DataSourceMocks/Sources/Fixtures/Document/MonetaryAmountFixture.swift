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
        currencyCode: String = "EUR" // TODO: Assign values to an enum
    ) -> MonetaryAmount {
        return MonetaryAmount(
            value: value,
            currencyCode: currencyCode,
        )
    }
}
