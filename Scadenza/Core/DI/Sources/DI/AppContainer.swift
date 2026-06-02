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

@MainActor
public final class AppContainer{

    public init(){

    }
    
    public func makeGreetingView() -> some View {
        let repository = MockGreetingRepository()
        let fetchGreetingUseCase = FetchGreetingUseCase(repository: repository)
        let greetingViewModel = GreetingViewModel(fetchGreetingUseCase: fetchGreetingUseCase)

        return GreetingView(viewModel: greetingViewModel)
    }
}

