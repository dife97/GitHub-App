//
//  FollowerListViewController.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

final class FollowersListViewController: GFViewController {
    
    //MARK: - Properties
    private let username: String
    
    
    //MARK: - UI
    private let followerListView = FollowersListView()
    
    
    //MARK: - Initializers
    init(username: String) {
        self.username = username
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycles
    override func loadView() {
        
        view = followerListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        title = username
        
        navigationController?.isNavigationBarHidden = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
