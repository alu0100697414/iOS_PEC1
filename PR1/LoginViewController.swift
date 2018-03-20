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
    
    // User and password are deleted from form
    override func viewWillAppear(_ animated: Bool) {
        
        usernameField.text = "";
        passwordField.text = "";
    }

    // END-UOC-5
    
    // BEGIN-UOC-6
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Get current hour
        let hour = Calendar.current.component(.hour, from: Date());
        print(hour);
        
        // Checks the hour and set the corresponding values
        if hour >= 6 && hour <= 11 {
            welcomeLabel.text = "Good morning";
            self.view.backgroundColor = UIColor.orange.lighter();
        }
        else if hour >= 12 && hour <= 17 {
            welcomeLabel.text = "Good afternoon";
            self.view.backgroundColor = UIColor.yellow.lighter();
        }
        else if hour >= 18 && hour <= 21 {
            welcomeLabel.text = "Good evening";
            self.view.backgroundColor = UIColor.red.lighter();
        }
        else if (hour >= 22 && hour <= 24) || (hour >= 0 && hour <= 5) {
            welcomeLabel.text = "Good night";
            self.view.backgroundColor = UIColor.blue.lighter();
        }
    }

    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
