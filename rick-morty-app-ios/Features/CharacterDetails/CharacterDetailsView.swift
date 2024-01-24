//
//  CharacterDetails.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/11/23.
//

import UIKit

class CharacterDetailsView: UIView {
    
    private let scrollView: UIScrollView
    private let imageView: UIImageView
    private let stackView: UIStackView
    private let backgroundView: UIView
    private let nameLabel: UILabel
    private let statusLabel: UILabel
    private let titleAboutLabel: UILabel
    private let specieLabel: UILabel
    private let originLabel: UILabel
    private let locationLabel: UILabel
    private let episodesTitleLabel: UILabel
    private let episodesLabel: UILabel
    
    init() {
        scrollView = UIScrollView()
        imageView = UIImageView()
        stackView = UIStackView()
        backgroundView = UIView()
        nameLabel = CustomLabel(text: "Rick", font: .customFont(type: .bold, size: 32))
        statusLabel = CustomLabel(text: "Alive", font: .customFont(type: .regular, size: 16))
        titleAboutLabel = CustomLabel(text: "About", font: .customFont(type: .bold, size: 18))
        specieLabel = CustomLabel(text: "Specie: Human", font: .customFont(type: .light, size: 16))
        originLabel = CustomLabel(text: "Origin: Rick's Memories", font: .customFont(type: .light, size: 16))
        locationLabel = CustomLabel(text: "Location: Earth", font: .customFont(type: .light, size: 16))
        episodesTitleLabel = CustomLabel(text: "Episodes", font: .customFont(type: .bold, size: 18))
        episodesLabel = CustomLabel(text: "000000: Pilot", font: .customFont(type: .light, size: 16))
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
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            scrollView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
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
            episodesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24)
        ])
    }
    
    func render() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .purple
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.backgroundColor = .blue

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 10
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = .white

        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        episodesTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}

