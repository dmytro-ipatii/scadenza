//
//  AppContainer.swift
//  DI
//
//  Created by Dmytro Ipatii on 02/06/2026.
//
import SwiftUI

import Foundation
import DataSource
import Entity
import Repository
import UseCase
import Presentation
import DataSourceMocks

@MainActor
public final class AppContainer {

    public init() {

    }

    public func createHomeScreen() -> some View {
        return HomeScreenView()
    }
}
