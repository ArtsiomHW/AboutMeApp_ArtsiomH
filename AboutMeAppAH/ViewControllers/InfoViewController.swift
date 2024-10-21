//
//  InfoViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 19.10.24.
//

import UIKit

final class InfoViewController: UIViewController {
    
    @IBOutlet var summaryTextView: UITextView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = user.userInfo.fullName
        
        summaryTextView.text = user.userInfo.summary
    }
    
}
