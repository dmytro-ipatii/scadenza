//
//  Date+EXT.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

import Foundation

public extension Date {

    func toLocalDateString() -> String {
        formatted(date: .abbreviated, time: .omitted)
    }

    func toLocalTimeString() -> String {
        formatted(date: .omitted, time: .shortened)
    }

}
