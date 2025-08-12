//
//  DetailRepository.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation

// MARK: - DetailRepositoryInput
protocol DetailRepositoryInput {
    
}

// MARK: - DetailRepositoryOutput
protocol DetailRepositoryOutput: AnyObject {
    
}

// MARK: - DetailRepository
final class DetailRepository: DetailRepositoryInput {
    
    // MARK: Properties
    weak var output: DetailRepositoryOutput?
}
