//
//  DetailInteractor.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation

// MARK: - DetailInteractorInput
protocol DetailInteractorInput {
    
}

// MARK: - DetailInteractorOutput
protocol DetailInteractorOutput: AnyObject {
    
}

// MARK: - DetailInteractor
final class DetailInteractor: DetailInteractorInput {
    
    // MARK: Properties
    private let repository: DetailRepositoryInput
    
    weak var output: DetailInteractorOutput?
    
    // MARK: Init
    init(repository: DetailRepositoryInput) {
        self.repository = repository
    }
}

// MARK: - DetailRepositoryOutput
extension DetailInteractor: DetailRepositoryOutput {
    
}
