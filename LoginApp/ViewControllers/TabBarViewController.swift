//
//  TabBarViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/26/25.
//

import UIKit

final class TabBarViewController: UITabBarController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Я все таки не понимаю где и как правильно менять заголовки
        // для UINavigationController и UITabBarController
        // Особенно если у нас большая иерархия из вьюконтроллеров
        
        viewControllers?.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                if let personVC = navigationVC.topViewController as? PersonViewController {
                    personVC.user = user
                    personVC.title = user.person.fullName
                }
            }
        }
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
    }

}
