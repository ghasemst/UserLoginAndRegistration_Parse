//
//  LoginViewController.swift
//  UserLoginAndRegistration
//
//  Created by Ghasem Tabatabaei on 02/11/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        self.userEmailTextField.resignFirstResponder()
        self.userPasswordTextField.resignFirstResponder()
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        
        if(userEmail == "" || userPassword == "") {
            displayMyAlertMessage("All fields are required!")
            return
        }
        
        PFUser.logInWithUsernameInBackground(userEmailTextField.text!, password: userPasswordTextField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            
            if(user != nil) {
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isUserLoggedIn")
                NSUserDefaults.standardUserDefaults().synchronize()
                    
                self.dismissViewControllerAnimated(true, completion: nil)
            } else {
                print("User not found!")
                self.displayMyAlertMessage("User not found!")
            }
        }
    }
    
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}