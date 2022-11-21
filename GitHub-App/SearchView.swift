//
//  SearchView.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class SearchView: UIView {
    
    private lazy var logoImageView = GFImageView(imageName: "github-logo")
    
    private lazy var usernameTextField = GFTextField(placeholder: "Enter a username")
    
    private lazy var getFollowersButton = GFButton(backgroundColor: .systemGreen,
                                                   title: "Get Followers")
    
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
}
