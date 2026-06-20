//
//  AssetRepositoryProtocol.swift
//  Repository
//
//  Created by Dmytro Ipatii on 17/06/2026.
//

import Foundation
import Entity

public protocol AssetRepositoryProtocol: Sendable {

    func store(_ data: Data, kind: AssetKind, fileName: String) async throws -> AssetReference

    func loadData(for reference: AssetReference) async throws -> Data

    func loadUrl(for reference: AssetReference) async throws -> URL

    func loadThumbnailData(for reference: AssetReference) async throws -> Data

    func delete(_ reference: AssetReference) async throws

}
