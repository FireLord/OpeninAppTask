//
//  LinkRepository.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

protocol LinkRepository {
    // MARK: API calling functions
    func getAllRecentLink() async throws -> [LinkData]
    func getAllTopLink() async throws -> [LinkData]
}
