//
//  File.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 22/08/2026.
//

import SwiftUI

public extension Binding where Value == Bool {

    init<T: Sendable>(ifNotNil value: Binding<T?>) {
        self.init(
            get: {
                value.wrappedValue != nil
            },
            set: { newValue in
                if !newValue {
                    value.wrappedValue = nil
                }
            })
    }
}

public extension Binding {

    init<T: Sendable>(asOptional value: Binding<T>) where Value == T?{
        self.init(
            get: {
                value.wrappedValue
            },
            set: { newValue in

                guard let newValue else { return }

                value.wrappedValue = newValue
            })
    }
}
