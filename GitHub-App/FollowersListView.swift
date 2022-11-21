//
//  FollowerListView.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

final class FollowersListView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureFollowerListView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFollowerListView() {
        
        additionalConfiguration()
    }
    
    private func additionalConfiguration() {
        
        backgroundColor = .systemBackground
    }
}
