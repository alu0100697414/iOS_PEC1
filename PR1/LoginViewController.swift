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
        
        // Check username and password
        let loginAllowed = Services.validate(
            username: String(usernameField.text!),
            password: String(passwordField.text!)
        );
        
        if loginAllowed == false { // Shows a notification
            Utils.show(Message: "Sorry, the username and password are invalid.", WithTitle: "Notification", InViewController: self);
        } else { // Change to the next screen.
            performSegue(withIdentifier: "SegueToAuthentication", sender: self);
        }
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    
    // User and password are deleted
    override func viewWillAppear(_ animated: Bool) {
        usernameField.text = "";
        passwordField.text = "";
    }

    // END-UOC-5
    
    // BEGIN-UOC-6

    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
