//
//  SearchView.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    
    func didTapGetFollowers()
}

final class SearchView: UIView {
    
    var usernameIsEntered: Bool {
        if let usernameText = usernameTextField.text, !usernameText.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    var didChangeSelection: (() -> Void)?
    
    private weak var delegate: SearchViewDelegate?
    
    private lazy var logoImageView = GFImageView(imageName: "github-logo")
    
    private lazy var usernameTextField: GFTextField = {
        let textField = GFTextField(placeholder: "Enter a username")
        
        textField.returnKeyType = .go
        
        textField.returnAction = { [unowned self] in
            
            self.delegate?.didTapGetFollowers()
        }
        
        textField.didChangeSelection = { [unowned self] in
            
            self.didChangeSelection?()
        }
        
        return textField
    }()
    
    lazy var getFollowersButton: GFButton = {
        let button = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
        
        button.buttonAction = { [unowned self] in
            
            self.delegate?.didTapGetFollowers()
        }
        
        button.disable()
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSearchView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSearchView() {
        
        configureLogoImageView()
        
        configureUsernameTextField()
        
        configureGetFollowersButton()
        
        additionalConfiguration()
    }
    
    private func configureLogoImageView() {
        
        addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func configureUsernameTextField() {
        
        addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func configureGetFollowersButton() {
        
        addSubview(getFollowersButton)
        
        NSLayoutConstraint.activate([
            getFollowersButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowersButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            getFollowersButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .systemBackground
    }
    
    func clearUsernameTextField() {
        
        usernameTextField.text = ""
        usernameTextField.resignFirstResponder()
    }
    
    func configure(delegate: SearchViewDelegate) {
        
        self.delegate = delegate
    }
}
