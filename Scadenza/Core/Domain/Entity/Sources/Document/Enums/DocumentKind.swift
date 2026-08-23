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

    public var systemImage: String {
        switch self {
        case .utilityBill:
            return "bolt.fill"

        case .taxNotice:
            return "building.columns.fill"

        case .insurancePolicy:
            return "shield.checkered"

        case .warranty:
            return "checkmark.seal.fill"

        case .contract:
            return "doc.text.fill"

        case .medicalDocument:
            return "cross.case.fill"

        case .schoolNotice:
            return "graduationcap.fill"

        case .identityDocument:
            return "person.text.rectangle.fill"

        case .vehicleDocument:
            return "car.fill"

        case .receipt:
            return "receipt.fill"

        case .other:
            return "doc.fill"
        }
    }
}
