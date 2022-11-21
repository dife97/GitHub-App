//
//  GFButton.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class GFButton: UIButton {
    
    var buttonAction: (() -> Void)?
    
    init(
        backgroundColor: UIColor,
        title: String
    ) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        self.setTitle(title, for: .normal)
        
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
        
        layer.cornerRadius = 10
        
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        
        addTarget(self, action: #selector(applyTapEffect), for: .touchDown)
        addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
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
