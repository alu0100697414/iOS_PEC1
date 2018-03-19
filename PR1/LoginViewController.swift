//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!

    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        
        let loginAllowed = Services.validate(
            username: String(usernameField.text!),
            password: String(passwordField.text!)
        );
        
        if loginAllowed == false {
            Utils.show(Message: "Sorry, the username and password are invalid.", WithTitle: "Notification", InViewController: self);
        } else {
            performSegue(withIdentifier: "SegueToAuthentication", sender: self);
        }
    }
    // END-UOC-2
    
    // BEGIN-UOC-5

    // END-UOC-5
    
    // BEGIN-UOC-6

    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
