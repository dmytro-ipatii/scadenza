//
//  DocumentKind.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public enum DocumentKind: String, Sendable, CaseIterable {
    case utilityBill
    case taxNotice
    case insurancePolicy
    case warranty
    case contract
    case medicalDocument
    case schoolNotice
    case identityDocument
    case vehicleDocument
    case receipt
    case other
}
