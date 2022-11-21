//
//  GFTextField.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class GFTextField: UITextField {
    
    var returnAction: (() -> Void)?
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        
        configureGTTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 50)
    }
    
    private func configureGTTextField() {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        delegate = self
        
        backgroundColor = .tertiarySystemBackground
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        textAlignment = .center
        tintColor = .label
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        autocorrectionType = .no
    }
}

extension GFTextField: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        returnAction?()
        
        return true
    }
}
