//
//  SectionHeaderReusableView.swift
//  TestItunesApp
//
//   Created by Ghost on 12.08.2025.
//

import UIKit

final class SectionHeaderReusableView: UICollectionReusableView {
    
    // MARK: Properties
    static let identifier = "SectionHeaderReusableView"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .label
        label.textAlignment = .left
        label.numberOfLines = 1
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
private extension SectionHeaderReusableView {
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(titleLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 10
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 10
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: 10
            ),
            titleLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: 10
            )
        ])
        
    }
}
