//
//  SearchViewController.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

final class SearchViewController: GFViewController {
    
    private let searchView = SearchView()
    
    private let searchViewModel = SearchViewModel()
    
    override func loadView() {
        
        view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    private func configureDelegates() {
        
        searchView.configure(delegate: self)
        
        searchViewModel.configure(delegate: self)
    }
}

extension SearchViewController: SearchViewDelegate {
    
    func didTapGetFollowers() {
        
        searchView.getFollowersButton.startLoading()
        
        searchViewModel.getFollowers()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    
    func didGetFollowers(username: String) {
        
        let followersListViewController = FollowersListViewController(username: username)
        
        navigationController?.pushViewController(followersListViewController, animated: true)
        
        searchView.getFollowersButton.stopLoading()
    }
}
