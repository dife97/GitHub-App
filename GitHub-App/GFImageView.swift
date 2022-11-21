//
//  GFImageView.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class GFImageView: UIImageView {
    
    init(
        imageName: String,
        contentMode: ContentMode = .scaleAspectFit
    ) {
        super.init(frame: .zero)
        
        configureGFImageView(imageName: imageName,
                             contentMode: contentMode)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureGFImageView(imageName: String,
                                      contentMode: ContentMode) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.contentMode = contentMode
        self.image = UIImage(named: imageName)
    }
}
