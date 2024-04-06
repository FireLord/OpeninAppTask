//
//  LinkRepositoryImpl.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

final class LinkRepositoryImpl: LinkRepository {
    let linkRemoteDataSource: LinkRemoteDataSource
    
    init(linkRemoteDataSource: LinkRemoteDataSource) {
        self.linkRemoteDataSource = linkRemoteDataSource
    }
    
    func getAllRecentLink() async throws -> [LinkData] {
        return try await linkRemoteDataSource.getAllRecentLink()
    }
    
    func getAllTopLink() async throws -> [LinkData] {
        return try await linkRemoteDataSource.getAllTopLink()
    }
}
