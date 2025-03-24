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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welomeLabel.text = """
Welcome, \(user.username)!
My name is \(user.person.firstName) \(user.person.lastName)
"""
    }

}
