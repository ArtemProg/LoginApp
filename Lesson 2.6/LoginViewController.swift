//
//  ViewController.swift
//  Lesson 2.6
//
//  Created by Artem on 3/21/25.
//

import UIKit

// Супер секретная таблица паролей
struct UserBD {
    var name: String
    var password: String
}

let users = [
    UserBD(name: "User", password: "Password"),
    UserBD(name: "Anna", password: "123"),
    UserBD(name: "Alex", password: "qwerty"),
    UserBD(name: "Admin", password: "Pa$$w0rd"),
]


final class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private var username: String? // ограничимся только именем
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let username = userNameTextField.text else { return false }
        guard let password = passwordTextField.text else { return false }
        
        guard isValidLogin(username: username, password: password) else {
            
            showAllert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login or password") {
                    self.passwordTextField.text = ""
            }
            
            return false
        }
        
        // Авторизовываем пользователя :)
        self.username = username
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let welcomeVC = segue.destination as? WelcomeViewController {
            welcomeVC.username = username
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        username = nil
    }
    
    @IBAction func showHint(sender: UIButton) {
        let message = users.map {
            sender.tag == 11 ? "\($0.name): \($0.password)" : $0.name
        }.joined(separator: "\n")
        
        showAllert(withTitle: "Secret data", andMessage: message)
    }

    private func isValidLogin(username: String, password: String) -> Bool {
        guard !(username.isEmpty && password.isEmpty) else { return false }
        
        // Выполняем подключение к БД и проверяем аутентификацию
        guard let userBD = users.first(where: { $0.name == username }) else { return false }
        
        return userBD.password == password
    }
    
    private func showAllert(withTitle title: String, andMessage message: String, closure: (() -> Void)? = nil) {
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            closure?()
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(action)
        present(alert, animated: true)
    }
}

