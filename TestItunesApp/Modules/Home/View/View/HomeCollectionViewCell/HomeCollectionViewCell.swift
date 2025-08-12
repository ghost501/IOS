//
//  HomeCollectionViewCell.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import UIKit

final class HomeCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    static let identifier = "HomeCollectionViewCell"
    
    // MARK: Views
    private lazy var songImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var songTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: HomeCollectionViewCellViewModel) {
        if let imageUrl = viewModel.artworkUrl {
            songImageView.downloaded(from: imageUrl)
        }
        
        songTitle.text = viewModel.collectionName
        priceLabel.text = viewModel.collectionPrice
        releaseDateLabel.text = viewModel.releaseDate
    }
}

// MARK: - Helpers
private extension HomeCollectionViewCell {
    private func addSubviews() {
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .systemGray5
        contentView.addSubview(songImageView)
        contentView.addSubview(songTitle)
        contentView.addSubview(priceLabel)
        contentView.addSubview(releaseDateLabel)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            songImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            songImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            songImageView.widthAnchor.constraint(equalToConstant: 100),
            songImageView.heightAnchor.constraint(equalToConstant: 120),
            
            songTitle.topAnchor.constraint(equalTo: songImageView.bottomAnchor, constant: 8),
            songTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            songTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: songTitle.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
    
            releaseDateLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            releaseDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            releaseDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
