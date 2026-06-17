//
//  File.swift
//  Repository
//
//  Created by Dmytro Ipatii on 17/06/2026.
//

import Foundation
import Entity

public protocol ExtractionRepositoryProtocol {

    var availability: ExtractorAvailability { get async }

    func prewarm() async

    func extract(from text: String, locale: Locale) -> AsyncThrowingStream<ExtractionEvent, Error>

}
