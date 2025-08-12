//
//  DetailContainer.swift
//  TestItunesApp
//
//  Created by Ghost on 12.08.2025.
//

import UIKit

// MARK: - DetailViewDelegate
protocol DetailViewDelegate: AnyObject {
    func setupViews()
}

// MARK: - DetailController
final class DetailController: UIViewController {
    
    // MARK: Propeties
    private let presenter: DetailPresenterInput
    
    // MARK: Views

    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let collectionNamelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collectionPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let longDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.setImage(UIImage(systemName: "pause.fill"), for: .selected)
        button.tintColor = .black
        button.backgroundColor = .black.withAlphaComponent(0.1)
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(togglePause), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()
        presenter.viewDidLoad()
    }
    
    init(presenter: DetailPresenterInput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: DetailViewModel) {
        collectionNamelabel.text = viewModel.name
        collectionPriceLabel.text = viewModel.price
        releaseDateLabel.text = viewModel.releaseDate
        longDescriptionLabel.text = viewModel.description
        
        if let imageUrl = viewModel.imageUrl {
            thumbnailImageView.downloaded(from: imageUrl)
        }
    }
    
    //MARK: - Private methods
    private func addSubviews() {
        
        [thumbnailImageView,
         collectionNamelabel,
         collectionPriceLabel,
         releaseDateLabel,
         longDescriptionLabel,
         playButton]
            .forEach {
                view.addSubview($0)
            }
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            thumbnailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 200),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 240),
            
            collectionNamelabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
            collectionNamelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionNamelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            collectionPriceLabel.topAnchor.constraint(equalTo: collectionNamelabel.bottomAnchor, constant: 16),
            collectionPriceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            releaseDateLabel.topAnchor.constraint(equalTo: collectionPriceLabel.bottomAnchor, constant: 4),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            playButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            playButton.heightAnchor.constraint(equalToConstant: 80),
            playButton.widthAnchor.constraint(equalToConstant: 80),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func togglePause() {
        UIView.animate(withDuration: 0.2) {
            self.playButton.isSelected.toggle()
            self.playButton.transform = CGAffineTransform(
                scaleX: 1.2,
                y: 1.2
            )
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.playButton.transform = .identity
            }
        }
    }
}

// MARK: - DetailViewDelegate
extension DetailController: DetailViewDelegate {
    func setupViews() {
        view.backgroundColor = .white
        navigationItem.title = "Detail"
    }
}
