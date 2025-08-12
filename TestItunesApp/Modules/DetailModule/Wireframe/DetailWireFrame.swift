//
//  DetailWireFrame.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import Foundation
import UIKit

// MARK: - DetailWireframeRoutable
protocol DetailWireframeRoutable {
    
}

// MARK: - DetailWireframe
final class DetailWireframe: DetailWireframeRoutable {
    
    // MARK: Properties
    weak var navigationController: UINavigationController?
}
