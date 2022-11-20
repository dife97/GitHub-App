//
//  SceneDelegate.swift
//  GitHub-App
//
//  Created by Diego Ferreira on 20/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = createTabBarController()
        
        window?.makeKeyAndVisible()
    }
    
    private func createTabBarController() -> UITabBarController {
        
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.tintColor = .systemGreen
        tabBarController.viewControllers = [createSearchNavigationController(), createFavoritesListNavigationController()]
        
        return tabBarController
    }
    
    private func createSearchNavigationController() -> UINavigationController {
        
        let searchViewController = SearchViewController()
        
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        return UINavigationController(rootViewController: searchViewController)
    }
    
    private func createFavoritesListNavigationController() -> UINavigationController {
        
        let favoritesListViewController = FavoritesListViewController()
        
        favoritesListViewController.title = "Favorites"
        favoritesListViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        return UINavigationController(rootViewController: favoritesListViewController)
    }
}
