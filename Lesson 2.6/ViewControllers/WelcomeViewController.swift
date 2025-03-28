//
//  WelcomeViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/21/25.
//

import UIKit

final class WelcomeViewController: UIViewController {

    @IBOutlet var welomeLabel: UILabel!
    
    var user: User!
    
    private let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
        
        welomeLabel.text = "Welcome, \(user.username)!\nMy name is \(user.person.fullName)"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    private func setupGradientBackground() {
        // 1. Настройка цветов градиента
        gradientLayer.colors = [
            UIColor.systemYellow.cgColor,
            UIColor.systemGreen.cgColor
        ]
        
        // 2. Направление градиента (сверху вниз)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        // 3. Добавляем градиент ниже всех элементов
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    

}
