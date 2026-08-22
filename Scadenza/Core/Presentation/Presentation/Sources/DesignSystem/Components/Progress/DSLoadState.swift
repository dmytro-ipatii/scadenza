//
//  DSLoadState.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import Foundation

public enum DSLoadState<Value: Sendable, Error: Sendable>: Sendable {
    case idle
    case loading
    case loaded(value: Value)
    case failed(error: Error)
}
