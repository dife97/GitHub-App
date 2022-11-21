//
//  SearchViewModel.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    
    func didGetFollowers(username: String)
}

final class SearchViewModel {
    
    private weak var delegate: SearchViewModelDelegate?
    
    func configure(delegate: SearchViewModelDelegate) {
        
        self.delegate = delegate
    }
    
    func getFollowers() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            
            guard let self = self else { return }
            
            self.delegate?.didGetFollowers(username: "Diego Lindo")
        }
    }
}
