//
//  SearchRequestModel.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation

final class SearchRequestModel: RequestModel {
    
    // MARK: Properties
    private let searchTerm: String
    private let mediaType: MediaType
    private let limit: String

    // MARK: Init
    init(searchTerm: String, limit: String, mediaType: MediaType) {
        self.searchTerm = searchTerm
        self.mediaType = mediaType
        self.limit = limit
    }

    override var path: String {
        return Constants.Api.search
    }

    override var method: RequestMethod {
        .post
    }

    override var parameters: [String : Any?] {
        return [
            "term": self.searchTerm,
            "media": self.mediaType.value,
            //"limit": self.limit
        ]
    }
}
