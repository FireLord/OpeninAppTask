//
//  LinkRemoteDataSource.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

protocol LinkRemoteDataSource {
    // MARK: API calling functions
    func getAllRecentLink() async throws -> [LinkData]
    func getAllTopLink() async throws -> [LinkData]
}
