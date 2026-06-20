//
//  PersistenceError.swift
//  Entity
//
//  Created by Dmytro Ipatii on 20/06/2026.
//

import Foundation

public enum PersistenceError: Sendable, Equatable, Error {
    case notFound
    case failedSave
    case failedUpdate
    case failedDelete
    case other(message: String)
}
