//
//  ViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 14.10.24.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    private let user = User.getUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.text = user.login
        passwordTF.text = user.password
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarVC = segue.destination as? UITabBarController
        
        tabBarVC?.viewControllers?.forEach({ viewController in
            if let welcome = viewController as? WelcomeViewController {
                welcome.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutVC = navigationVC.topViewController as? AboutMeViewController
                aboutVC?.user = user
            }
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == user.login, passwordTF.text == user.password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Please, enter correct login and password") {
                    self.passwordTF.text = ""
                }
            return false
        }
        return true
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    @IBAction func forgotUserCredentials(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Ooops!", andMessage: "Your user name is \(user.login) 🤫")
        : showAlert(withTitle: "Ooops!", andMessage: "Your password is \(user.password) 🤫")
    }
    
    private func showAlert(
        withTitle title: String,
        andMessage message: String,
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

