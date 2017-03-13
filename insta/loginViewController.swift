//
//  loginViewController.swift
//  insta
//
//  Created by Yukkee chang on 3/11/17.
//  Copyright © 2017 Yukkee chang. All rights reserved.
//

import UIKit
import Parse

class loginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func signIn(_ sender: Any) {
        let username = userTextField.text
        let password = passwordTextField.text
        PFUser.logInWithUsername(inBackground: username!, password: password!) {
            (user: PFUser?, error: Error?) -> Void in
            if let error = error {
                print(error.localizedDescription)
                print("error w log in")
                //put the alert here and stop user from logging in
            } else {
                print("Logged in!");
                //todo: perform segue to go to chat view controller:
                self.performSegue(withIdentifier: "successLogin", sender: nil)
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = userTextField.text
        newUser.password = passwordTextField.text
        
        newUser.signUpInBackground() {
            (succeeded: Bool?, error: Error? ) -> Void in
            if error == nil {
                print("success in log in")
                self.performSegue(withIdentifier: "successLogin", sender: nil)

            } else {
                print(error?.localizedDescription)
            }

        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
