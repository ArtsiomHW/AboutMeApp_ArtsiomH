//
//  ViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 14.10.24.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginStackView: UIStackView!
    
    // MARK: - Properties
    var isKeyboardShown = false
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardHandling()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? WelcomeViewController else {return}
        mainVC.userName = userNameTF.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTF.text == "Qwerty", passwordTF.text == "12345" else {
            showAlert(withTitle: "Invalid login or password", andMessage: "Please, enter correct login and password")
            return false
        }
        return true
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    // MARK: - Restore login and password
    @IBAction func forgotUsernameButton() {
        showAlert(withTitle: "Ooops!", andMessage: "Your user name is Qwerty 🤫")
    }
        
    @IBAction func forgotPasswordButton() {
        showAlert(withTitle: "Ooops!", andMessage: "Your password is 12345 🤫")
    }
    
    
    // MARK: - Private Methods
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Keyboard handling logic
private extension MainViewController {

    @objc func keyboardWillShow(notification: NSNotification) {
            if !isKeyboardShown {
                moveLoginUp(notification: notification)
                isKeyboardShown = true
            }
        }
        
    @objc func keyboardWillHide(notification: NSNotification) {
            if isKeyboardShown {
                moveLoginDown(notification: notification)
                isKeyboardShown = false
            }
        }
    
    @objc func moveLoginUp(notification: NSNotification) {
        
        //Calculate of keyboard height
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.size.height
        
        //Calculate of login content heigh
        let emptySpaceHight = view.frame.size.height - loginStackView.frame.maxY
        
        //Calculate the difference where content is covered
        let coveredContentHight = keyboardHeight - emptySpaceHight
        
        //Move keyboard
        if coveredContentHight > 0 {
            view.frame.origin.y = -coveredContentHight
        } else {
            view.frame.origin.y = coveredContentHight
        }
    }
    
    @objc func moveLoginDown(notification: NSNotification) {
        view.frame.origin.y = 0
    }
   
    @IBAction func closeKeyBoardTapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func setupKeyboardHandling() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
