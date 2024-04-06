//
//  GetTopLinkUseCase.swift
//  OpeninAppTaskAman
//
//  Created by Aman Kumar on 06/04/24.
//

import Foundation

final class GetTopLinkUseCase {
    let linkRepository: LinkRepository
    
    init(linkRepository: LinkRepository) {
        self.linkRepository = linkRepository
    }
    
    func execute() async throws -> [LinkData] {
        return try await linkRepository.getAllTopLink()
    }
}
