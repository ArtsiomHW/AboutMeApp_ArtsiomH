//
//  WelcomeViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 14.10.24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet var greetingMessageLabel: UILabel!
    
    var userName: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        greetingMessageLabel.text = "Welcome, \(userName ?? "user name")!"
    }
    

}
