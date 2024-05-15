//
//  WelcomeViewController.swift
//  LoginUserApp
//
//  Created by Tatiana G on 9/22/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    private let primaryColor = UIColor(
        red: 210 / 255,
        green: 110 / 255,
        blue: 130 / 255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 110 / 255,
        green: 150 / 255,
        blue: 230 / 255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradient(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(user.person.fullName) ✋!"
        welcomeLabel.accessibilityIdentifier = AccessibilityIDs.Welcome.welcomeTitleAccessibilityIdText
    }
}

extension WelcomeViewController {
    func addVerticalGradient(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer ()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
