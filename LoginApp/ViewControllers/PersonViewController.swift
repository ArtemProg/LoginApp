//
//  PersonViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/24/25.
//

import UIKit

final class PersonViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.person.fullName
        navigationItem.backButtonTitle = user.person.fullName
        
        imageView.backgroundColor = .systemGray6
        
        fillPersonInfo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let bioVC = segue.destination as? PersonBioViewController {
            bioVC.user = user
            
            // У меня ни как не получалось одновременно выводить корректное отображение
            // кнопки Back и заголовка на экране с биографией.
            // Корректно ли так делать?
            let backItem = UIBarButtonItem()
            backItem.title = user.person.fullName
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    private func fillPersonInfo() {
        
        let person = user.person
        
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        companyLabel.text = person.company
        departmentLabel.text = person.department
        positionLabel.text = person.position
        ageLabel.text = person.age.formatted()
        
        imageView.image = UIImage(named: user.username) ?? UIImage(systemName: "person.fill")
    }
}
