//
//  AboutMeViewController.swift
//  AboutMeAppAH
//
//  Created by Artem H on 19.10.24.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var surnameLabel: UILabel!
    @IBOutlet var companyLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    @IBOutlet var avatarImageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = user.userInfo.fullname
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.image = UIImage(named: user.userInfo.avatar)
        
        nameLabel.text = user.userInfo.name
        surnameLabel.text = user.userInfo.surname
        companyLabel.text = user.userInfo.company
        departmentLabel.text = user.userInfo.department
        positionLabel.text = user.userInfo.position
        
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let infoVC = segue.destination as? InfoViewController else { return }
            infoVC.user = user
        }
    
}
