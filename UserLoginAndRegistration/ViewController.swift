//
//  ViewController.swift
//  UserLoginAndRegistration
//
//  Created by Ghasem Tabatabaei on 02/11/15.
//  Copyright © 2015 Ghasem Tabatabaei. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn")
        
        if(!isUserLoggedIn) {
            self.performSegueWithIdentifier("loginView", sender: self)
        }
    }
    
    @IBAction func logoutBottunTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.performSegueWithIdentifier("loginView", sender: self)
    }
}