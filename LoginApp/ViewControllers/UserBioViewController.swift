//
//  BioViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/28/25.
//

// Данный экран выезжает справа на лево.
// кажется что элементы экрана такие как заголовок и текстовое поле
// выезжают с разной скоростью и выглядит как то "дергано"
// Нормально ли это?

import UIKit

final class UserBioViewController: UIViewController {

    @IBOutlet weak var bioTextView: UITextView!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "\(user.person.fullName) Bio"
        
        bioTextView.text = user.person.bio
        bioTextView.isEditable = false
    }
}
