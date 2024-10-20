//
//  InfoViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 19.10.24.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet var summaryTextView: UITextView!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = (user?.userInfo.name ?? " ") + " " + (user?.userInfo.surname ?? " ")
        
        summaryTextView.text = user?.userInfo.summary
    }
    
}
