//
//  LinkRemoteDataSourceImpl.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

final class LinkRemoteDataSourceImpl: LinkRemoteDataSource {
    func getAllRecentLink() async throws -> [LinkData] {
        return try await OpeninAppAPIService.shared.getAllRecentData()
    }
    
    func getAllTopLink() async throws -> [LinkData] {
        return try await OpeninAppAPIService.shared.getAllTopData()
    }
    
    func getSourceData() async throws -> DataFetch {
        return try await OpeninAppAPIService.shared.getSourceData()
    }
}
