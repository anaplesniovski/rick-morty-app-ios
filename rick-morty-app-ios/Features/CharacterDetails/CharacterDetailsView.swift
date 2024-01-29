//
//  CharacterDetails.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/11/23.
//

import UIKit

class CharacterDetailsView: UIView {
    
    private var imageView: UIImageView
    private var scrollView: UIScrollView
    private var stackView: UIStackView
    private var backgroundView: UIView
    private var nameLabel: UILabel
    private var statusLabel: UILabel
    private var titleAboutLabel: UILabel
    private var specieLabel: UILabel
    private var originLabel: UILabel
    private var locationLabel: UILabel
    private var episodesTitleLabel: UILabel
    private var episodesLabel: UILabel
    
    var character: Character?
    
    init() {
        imageView = UIImageView()
        scrollView = UIScrollView()
        stackView = UIStackView()
        backgroundView = UIView()
        nameLabel = CustomLabel()
        statusLabel = CustomLabel()
        titleAboutLabel = CustomLabel()
        specieLabel = CustomLabel()
        originLabel = CustomLabel()
        locationLabel = CustomLabel()
        episodesTitleLabel = CustomLabel()
        episodesLabel = CustomLabel()
        super.init(frame: .zero)
        backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CharacterDetailsView: ViewCodable {
    func buildHierarchy() {
        addSubview(imageView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(backgroundView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(statusLabel)
        backgroundView.addSubview(titleAboutLabel)
        backgroundView.addSubview(specieLabel)
        backgroundView.addSubview(originLabel)
        backgroundView.addSubview(locationLabel)
        backgroundView.addSubview(episodesTitleLabel)
        backgroundView.addSubview(episodesLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            scrollView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: -8),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            backgroundView.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: self.backgroundView.leadingAnchor, constant: 24),
            nameLabel.trailingAnchor.constraint(equalTo: self.backgroundView.trailingAnchor, constant: -24),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),

            statusLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            titleAboutLabel.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 20),
            titleAboutLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleAboutLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            specieLabel.topAnchor.constraint(equalTo: self.titleAboutLabel.bottomAnchor, constant: 20),
            specieLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            specieLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            originLabel.topAnchor.constraint(equalTo: self.specieLabel.bottomAnchor, constant: 20),
            originLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            originLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            locationLabel.topAnchor.constraint(equalTo: self.originLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            episodesTitleLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 20),
            episodesTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            episodesTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            episodesLabel.topAnchor.constraint(equalTo: self.episodesTitleLabel.bottomAnchor, constant: 20),
            episodesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            episodesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            episodesLabel.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -30)
            
        ])
    }
    
    func render() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 15
        backgroundView.layer.shadowColor = UIColor.black.cgColor
        backgroundView.layer.shadowOpacity = 0.5
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
        backgroundView.layer.shadowRadius = 4
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .customFont(type: .bold, size: 32)
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = .customFont(type: .regular, size: 16)
        
        titleAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAboutLabel.text = "About"
        titleAboutLabel.font = .customFont(type: .bold, size: 18)
        
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        specieLabel.font = .customFont(type: .light, size: 16)
        
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.font = .customFont(type: .light, size: 16)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = .customFont(type: .light, size: 16)
        
        episodesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesTitleLabel.text = "Episodes"
        episodesTitleLabel.font = .customFont(type: .bold, size: 18)
        
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.font = .customFont(type: .light, size: 16)
        episodesLabel.text = "00000000"

    }
    
    func configureDetails(with character: Character, image: UIImage?) {
        imageView.image = image
        nameLabel.text = character.name
        statusLabel.text = character.status
        specieLabel.text = "Specie: \(character.species)"
        originLabel.text = "Origin: \(character.origin.name)"
        locationLabel.text = "Location: \(character.location.name)"
        episodesLabel.text = character.location.name
    }
}

