//
//  UserInfoViewController.swift
//  LoginUserApp
//
//  Created by Tatiana G on 9/22/21.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
}
