//
//  HomevIEW.swift
//  rick-morty-app-ios
//
//  Created by Ana Paula Lesniovski on 29/01/24.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didButtonPressed()
}

class HomeView: UIView {
    
    private var rickAndMortyImageView: UIImageView
    private var welcomeLabel: UILabel
    private var textWelcomeLabel: UILabel
    private var welcomeButton: UIButton
    private var stackView: UIStackView
    
    weak var delegate: HomeViewDelegate?
    
    init() {
        rickAndMortyImageView = UIImageView(image: UIImage(named: "RickAndMorty"))
        welcomeLabel = UILabel()
        textWelcomeLabel = UILabel()
        welcomeButton = UIButton()
        stackView = UIStackView(arrangedSubviews: [rickAndMortyImageView, welcomeLabel, textWelcomeLabel, welcomeButton])
        super.init(frame: .zero)
        backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodable {
    func buildHierarchy() {
        addSubview(stackView)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -64),

            welcomeButton.heightAnchor.constraint(equalToConstant: 64),
            welcomeButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 24),
            welcomeButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -24)
        ])
    }
    
    func render() {
        rickAndMortyImageView.translatesAutoresizingMaskIntoConstraints = false
        rickAndMortyImageView.contentMode = .scaleAspectFit
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome!"
        welcomeLabel.font = .customFont(type: .bold, size: 32)
        
        textWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        textWelcomeLabel.text = "In this app you will have access to about of characters, images, locations and episodes about the TV show Rick and Morty."
        textWelcomeLabel.numberOfLines = 0
        textWelcomeLabel.textAlignment = .center
        textWelcomeLabel.font = .customFont(type: .light, size: 14)
        
        welcomeButton.translatesAutoresizingMaskIntoConstraints = false
        welcomeButton.layer.cornerRadius = 22
        welcomeButton.layer.borderWidth = 1.0
        welcomeButton.setTitle("See characters", for: .normal)
        welcomeButton.setTitleColor(.black, for: .normal)
        welcomeButton.titleLabel?.font = .customFont(type: .bold, size: 16)
        welcomeButton.backgroundColor = .clear
        welcomeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.alignment = .center
    }
    
    @objc
    private func buttonPressed() {
        delegate?.didButtonPressed()
    }
}
