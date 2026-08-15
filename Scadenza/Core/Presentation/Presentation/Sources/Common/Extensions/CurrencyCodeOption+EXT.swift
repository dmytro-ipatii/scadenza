//
//  CurrencyCodeOption+EXT.swift
//  Entity
//
//  Created by Dmytro Ipatii on 03/08/2026.
//

import Entity
import Foundation

public extension CurrencyCodeOption {

    var currency: Locale.Currency {
        Locale.Currency(rawValue)
    }

    func localizedName(_ locale: Locale = .current) -> String? {
        locale.localizedString(forCurrencyCode: rawValue)
    }

    func format(amount: Decimal, _ locale: Locale = .current) -> String {
        amount.formatted(.currency(code: rawValue).locale(locale))
    }

}
