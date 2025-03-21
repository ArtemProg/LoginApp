//
//  WelcomeViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/21/25.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welomeLabel.text = "Welcome, \(username ?? "")!"
    }

}
