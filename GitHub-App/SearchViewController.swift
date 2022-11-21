//
//  SearchViewController.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

final class SearchViewController: GFViewController {
    
    private lazy var searchView: SearchView = {
        let view = SearchView()
        
        view.didChangeSelection = { [unowned self] in
            
            self.checkToEnableGetFollowersButton()
        }
        
        return view
    }()
    
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
    
    private func checkToEnableGetFollowersButton() {
        
        if searchView.usernameIsEntered {
            searchView.getFollowersButton.enable()
        } else {
            searchView.getFollowersButton.disable()
        }
    }
}

extension SearchViewController: SearchViewDelegate {
    
    func didTapGetFollowers() {
        
        searchView.getFollowersButton.startLoading()
        searchView.endEditing(true)
        
        searchViewModel.getFollowers()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    
    func didGetFollowers(username: String) {
        
        let followersListViewController = FollowersListViewController(username: username)
        
        navigationController?.pushViewController(followersListViewController, animated: true)
        
        searchView.getFollowersButton.stopLoading()
        searchView.clearUsernameTextField()
    }
}
