//
//  DSOptionPickerValueProtocol.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 15/08/2026.
//

public protocol DSOptionPickerValueProtocol: Identifiable, Equatable, Hashable, Sendable {
    var title: String { get }
}
