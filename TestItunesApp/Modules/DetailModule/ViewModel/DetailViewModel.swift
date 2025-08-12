//
//  DetailViewModel.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation

struct DetailViewModel {
    let imageUrl: URL?
    let name: String
    let price: String
    let releaseDate: String
    let description: String
    
    init(viewModel: HomeCollectionViewCellViewModel) {
        imageUrl = viewModel.artworkUrl
        name = viewModel.collectionName
        price = viewModel.collectionPrice
        releaseDate = viewModel.releaseDate
        description = viewModel.description
    }
}
