//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    
    // BEGIN-UOC-4
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        firstField.delegate = self;
        secondField.delegate = self;
        thirdField.delegate = self;
        fourthField.delegate = self;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 1
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        let password = firstField.text! + secondField.text! + thirdField.text! + fourthField.text!;
        
        let loginAllowed = Services.validate( code: password );
        
        if loginAllowed == true {
            performSegue(withIdentifier: "SegueToMainNavigation", sender: self);
        } else {
            Utils.show(Message: "Sorry, the entered code is not valid.", WithTitle: "Notification", InViewController: self)
        }
    }
    
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
