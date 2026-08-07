//
//  DSSegmentItemProtocol.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 07/08/2026.
//

import SwiftUI

public protocol DSSegmentItemProtocol: Identifiable, Hashable, CaseIterable {
    var title: LocalizedStringKey { get }
}
