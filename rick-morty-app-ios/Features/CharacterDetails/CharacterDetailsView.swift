//
//  CharacterDetails.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski dos Santos on 30/11/23.
//

import UIKit

class CharacterDetailsView: UIView {
    
    var scrollView: UIScrollView
    var imageView: UIImageView
    var stackView: UIStackView
    var backgroundView: UIView
    var nameLabel: UILabel
    var statusLabel: UILabel
    var titleAboutLabel: UILabel
    var specieLabel: UILabel
    var originLabel: UILabel
    var locationLabel: UILabel
    var titleEpisodesLabel: UILabel
    var episodesLabel: UILabel
    
    init() {
        scrollView = UIScrollView()
        imageView = UIImageView()
        stackView = UIStackView()
        backgroundView = UIView()
        nameLabel = UILabel()
        statusLabel = UILabel()
        titleAboutLabel = UILabel()
        specieLabel = UILabel()
        originLabel = UILabel()
        locationLabel = UILabel()
        titleEpisodesLabel = UILabel()
        episodesLabel = UILabel()
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
        addSubview(scrollView)
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(backgroundView)
        backgroundView.addSubview(nameLabel)
        backgroundView.addSubview(statusLabel)
        backgroundView.addSubview(titleAboutLabel)
        backgroundView.addSubview(specieLabel)
        backgroundView.addSubview(originLabel)
        backgroundView.addSubview(locationLabel)
        backgroundView.addSubview(titleEpisodesLabel)
        backgroundView.addSubview(episodesLabel)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 350),
            
            stackView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor),
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
            
            titleEpisodesLabel.topAnchor.constraint(equalTo: self.locationLabel.bottomAnchor, constant: 20),
            titleEpisodesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleEpisodesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            episodesLabel.topAnchor.constraint(equalTo: self.titleEpisodesLabel.bottomAnchor, constant: 20),
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
        nameLabel.text = "Rick"
        nameLabel.font = .customFont(type: .bold, size: 32)
        nameLabel.backgroundColor = .red

        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Alive"
        statusLabel.font = .customFont(type: .regular, size: 12)
        
        titleAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        titleAboutLabel.text = "About"
        titleAboutLabel.font = .customFont(type: .bold , size: 12)
        
        specieLabel.translatesAutoresizingMaskIntoConstraints = false
        specieLabel.text = "Specie: Human"
        specieLabel.font = .customFont(type: .light , size: 12)
        
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        originLabel.text = "Origin: Rick's Memories"
        originLabel.font = .customFont(type: .light , size: 12)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Location: Earth"
        locationLabel.font = .customFont(type: .light , size: 12)
        
        titleEpisodesLabel.translatesAutoresizingMaskIntoConstraints = false
        titleEpisodesLabel.text = "Episodes"
        titleEpisodesLabel.font = .customFont(type: .light , size: 12)
        
        episodesLabel.translatesAutoresizingMaskIntoConstraints = false
        episodesLabel.text = "000000: Pilot"
        episodesLabel.font = .customFont(type: .light , size: 12)
    }
}


// readme
// excluir branch

// Layout
// didSelect
// dados 
// navigationController ?
