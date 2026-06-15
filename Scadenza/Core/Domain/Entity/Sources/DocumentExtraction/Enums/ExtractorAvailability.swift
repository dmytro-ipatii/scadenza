//
//  ExtractorAvailability.swift
//  Entity
//
//  Created by Dmytro Ipatii on 14/06/2026.
//

import Foundation

public enum ExtractorAvailability: Sendable, Equatable {
    case available
    case unavailableDeviceUnsupported
    case unavailableAINotEnabled
    case unavailableModelDownloading(progress: Double)
    case unavailableLowBattery
    case unavailableRegion
    case unavailableOther(reason: String)
}
