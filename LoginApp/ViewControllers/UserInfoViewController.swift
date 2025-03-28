//
//  PersonViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/24/25.
//

import UIKit

final class UserInfoViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var jobTitleLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
        imageView.backgroundColor = .systemGray6
        fillPersonInfo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userBioVC = segue.destination as? UserBioViewController else { return }
        userBioVC.user = user
            
            // У меня ни как не получалось одновременно выводить корректное отображение
            // кнопки Back и заголовка на экране с биографией.
            // Корректно ли так делать?
//            let backItem = UIBarButtonItem()
//            backItem.title = user.person.fullName
//            navigationItem.backBarButtonItem = backItem
        
    }
    
    private func fillPersonInfo() {
        
        let person = user.person
        
        firstNameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        jobLabel.text = person.job.title
        departmentLabel.text = person.job.department.rawValue
        jobTitleLabel.text = person.job.jobTitle.rawValue
        
        imageView.image = UIImage(named: user.person.photo) ?? UIImage(systemName: "person.fill")
    }
}
