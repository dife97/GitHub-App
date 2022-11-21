//
//  FavoritesViewController.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class FavoritesListViewController: GFViewController {
    
    private let favoriteListView = FavoriteListView()
    
    override func loadView() {
        
        view = favoriteListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBlue
    }
}
