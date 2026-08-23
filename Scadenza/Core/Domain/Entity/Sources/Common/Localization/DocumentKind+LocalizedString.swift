//
//  DocumentKind+LocalizedString.swift
//  Entity
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import Entity

extension DocumentKind {

    // TODO: Add
    public var localizedString: String {
        switch self {
        case .utilityBill:
            "Utility Bill"
        case .taxNotice:
            "Tax Notice"
        case .insurancePolicy:
            "Insurance Policy"
        case .warranty:
            "Warranty"
        case .contract:
            "Contract"
        case .medicalDocument:
            "Medical Document"
        case .schoolNotice:
            "School Notice"
        case .identityDocument:
            "Identity Document"
        case .vehicleDocument:
            "Vehicle Document"
        case .receipt:
            "Receipt"
        case .other:
            "Other"
        }
    }
}
