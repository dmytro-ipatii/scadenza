//
//  FeedbackStateColor.swift
//  Presentation
//
//  Created by Dmytro Ipatii on 06/08/2026.
//

import SwiftUI

public enum FeedbackStateColor {
    public static let valid = ColorToken.success
    public static let expiring = ColorToken.warning
    public static let expired = ColorToken.danger
    public static let archived = ColorToken.disabled
}
