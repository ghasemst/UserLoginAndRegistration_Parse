//
//  RegisterPageViewController.swift
//  UserLoginAndRegistration
//
//  Created by Ghasem Tabatabaei on 02/11/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit
import Parse

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
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
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        self.userEmailTextField.resignFirstResponder()
        self.userPasswordTextField.resignFirstResponder()
        self.userRepeatPasswordTextField.resignFirstResponder()
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPasword = userRepeatPasswordTextField.text
        
        if(userEmail == "" || userPassword == "" || userRepeatPasword == "") {
            displayMyAlertMessage("All fields are required!")
            return
        }
        
        if(userPassword != userRepeatPasword) {
            displayMyAlertMessage("Passwords do not match!")
            return
        }
        
        let myUser:PFUser = PFUser()
        myUser.username = userEmail
        myUser.password = userPassword
        myUser.email = userEmail
        
        myUser.signUpInBackgroundWithBlock {(
            Success: Bool?, error: NSError?) -> Void in
            
            print("Registration is successful")
            
            // Displaying alert message with confirmation
            var myAlert = UIAlertController(title: "Ok", message: "Registration is successful", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default) { action in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true, completion: nil)
        }
    }
    
    func displayMyAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}