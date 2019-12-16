//
//  LogInViewController.swift
//  LogInRegistration
//
//  Created by Delowar on 10/21/19.
//  Copyright © 2019 Delowar. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: UIButton) {
        
        let email = userEmail.text!;
        let password = userPassword.text!;
        let emailStor = UserDefaults.standard.string(forKey: "userEmail");
        let passwordStor = UserDefaults.standard.string(forKey:"userPassword");
        
        func displayAlert(userMessage:String){
    
            let myAlert = UIAlertController(title: "Please Check !!!", message: userMessage, preferredStyle: UIAlertController.Style.alert);
            
            // add the actions (buttons)
            let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
            myAlert.addAction(okAction);
            
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil);
            myAlert.addAction(cancelAction);
            // show the alert
            self.present(myAlert, animated: true, completion: nil);
        }
        
        if(email == emailStor)
        {
            if(password == passwordStor)
            {
                //for pass data
//            func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//                    let destVC : HomeViewController = segue.destination as! HomeViewController
//                    destVC.dataFromFirst = "Hello there!"
//                }
                //for go another view controller using programming
                performSegue(withIdentifier:"homeView",sender: self )
                
                
                //alert
                let Alert = UIAlertController(title: "Thanks ", message: "your Login successful", preferredStyle: UIAlertController.Style.alert);
                //dismiss alert
                
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
                Alert.addAction(okAction);
                
                self.present(Alert,animated: true,completion: nil);
    
                
            }
            else{
//            displayAlert(userMessage: "Password Not match !");
                let myAlert = UIAlertController(title: "Please Check !!!", message: "Password Not match !", preferredStyle: UIAlertController.Style.alert);
                
                // add the actions (buttons)
                let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
                myAlert.addAction(okAction);
                
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil);
                myAlert.addAction(cancelAction);
                // show the alert
                self.present(myAlert, animated: true, completion: nil);
            }
        }
        else
        {
            displayAlert(userMessage: "Email or Passwords do not match");
            
        }
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
