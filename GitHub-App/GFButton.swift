//
//  GFButton.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class GFButton: UIButton {
    
    private var buttonTitle: String
    
    private var buttonBackgroundColor: UIColor
    
    var buttonAction: (() -> Void)?
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView(style: .medium)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.color = .white
        
        return activityIndicatorView
    }()
    
    init(
        backgroundColor: UIColor,
        title: String
    ) {
        self.buttonTitle = title
        self.buttonBackgroundColor = backgroundColor
        
        super.init(frame: .zero)
        
        configureGFButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    
    private func configureGFButton() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = buttonBackgroundColor
        
        layer.cornerRadius = 10
        
        setTitle(buttonTitle, for: .normal)
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        addTarget(self, action: #selector(applyTapEffect), for: .touchDown)
        addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
    }
    
    func enable() {
        
        self.isEnabled = true
        
        backgroundColor = buttonBackgroundColor
    }
    
    func disable() {
        
        self.isEnabled = false
        
        backgroundColor = .systemGray
    }
    
    func startLoading() {
        
        addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        setTitle("", for: .normal)
        
        loadingView.startAnimating()
    }
    
    func stopLoading() {
        
        loadingView.stopAnimating()
        
        setTitle(buttonTitle, for: .normal)
    }
    
    @objc
    private func applyTapEffect() {

        titleLabel?.alpha = 0.5
    }
    
    @objc
    private func didTouchUpInside() {

        titleLabel?.alpha = 1
        
        buttonAction?()
    }
}
