//
//  RegisterPageViewController.swift
//  LogInRegistration
//
//  Created by Delowar on 10/21/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword:UITextField!
    @IBOutlet weak var userConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   //
    
    
    
    
    @IBAction func registerButton(_ sender: UIButton) {
        //
        func displayAlert(userMessage:String)
        {
            // create the alert
            let alert = UIAlertController(title: "Please Check !!!", message: userMessage, preferredStyle: UIAlertController.Style.alert);
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil));
            
            // show the alert
            self.present(alert, animated: true, completion: nil);
        }
        
        
        //variable declaratin
        
        let name=userName.text!;
        let email = userEmail.text!;
        let password=userPassword.text!;
        let confirmPassword=userConfirmPassword.text!;
        
        //Check for empty field
        if(name.isEmpty  || email.isEmpty || password.isEmpty  || confirmPassword.isEmpty){
            //display aleart message
            displayAlert(userMessage : "All field are required");
            /*let alert = UIAlertController(title: "Please Check !!!", message: "All field are required", preferredStyle: UIAlertController.Style.alert);
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil));
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil));
            
            // show the alert
            self.present(alert, animated: true, completion: nil);
            */
            return;
        }
        //check password match or not
        if(password != confirmPassword)
        {
           displayAlert(userMessage : "passwords do not match");
            
            /*
            let myAlert = UIAlertController(title: "Please Check !!!", message: "passwords do not match", preferredStyle: UIAlertController.Style.alert);
            
            // add the actions (buttons)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
            myAlert.addAction(okAction);
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil);
            myAlert.addAction(cancelAction);
            // show the alert
            self.present(myAlert, animated: true, completion: nil);*/
            
            return;
        }
        //store data
        UserDefaults.standard.set(email,forKey: "userEmail");

        UserDefaults.standard.set(password,forKey: "userPassword");
        
        //Display alert message with confirmation
        
        let Alert = UIAlertController(title: "Congratulations", message: "Registration successful", preferredStyle: UIAlertController.Style.alert);
        //dismiss alert
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){
            ACTION in self.dismiss(animated: true, completion:nil);
        }
        Alert.addAction(okAction);
        self.present(Alert,animated: true,completion: nil);
        
        //self.presentedViewController(Alert,dismiss(animated: true, completion: nil));
        
    }
    
}
