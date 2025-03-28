//
//  ViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/21/25.
//

import UIKit


final class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = User.getUser()

    override func viewDidLoad() {
        fillInLoginPassword()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? TabBarViewController else {
            return
        }
        tabBarVC.user = user
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        guard userNameTextField.text == user.username, passwordTextField.text == user.password else {
            showAllert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login or password") {
                    self.passwordTextField.text = ""
            }
            return false
        }
                
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func showHint(sender: UIButton) {
        let message = sender.tag == 11
            ? "\(self.user.username): \(self.user.password)"
            : self.user.username
        showAllert(withTitle: "Secret data", andMessage: message)
    }
    
    private func showAllert(withTitle title: String, andMessage message: String, closure: (() -> Void)? = nil) {
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            closure?()
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func fillInLoginPassword() {
        userNameTextField.text = self.user.username
        passwordTextField.text = self.user.password
    }
}

