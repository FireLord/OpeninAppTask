//
//  GetSourceDataUseCase.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

final class GetSourceDataUseCase {
    let linkRepository: LinkRepository
    
    init(linkRepository: LinkRepository) {
        self.linkRepository = linkRepository
    }
    
    func execute() async throws -> DataFetch {
        return try await linkRepository.getSourceData()
    }
}
