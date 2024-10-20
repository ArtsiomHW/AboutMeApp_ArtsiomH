//
//  WelcomeViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 14.10.24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var greetingMessageLabel: UILabel!
    @IBOutlet var yourNameIsLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        greetingMessageLabel.text = "Welcome, \(user?.login ?? " ")!"
        yourNameIsLabel.text = "Your name is \(user?.userInfo.name ?? " ")."
    }
}
