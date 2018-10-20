//
//  LoginViewController.swift
//  Week4Assignment
//
//  Created by WaiYanPhyo Hein on 10/20/18.
//  Copyright © 2018 WaiYanPhyo Hein. All rights reserved.
//

import UIKit;
import Parse;

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var Activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Activity.isHidden = true;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInAction(_ sender: Any) {
        Activity.startAnimating();
        Activity.isHidden = false;
        PFUser.logInWithUsername(inBackground: userName.text!, password: passWord.text!, block: { (user :PFUser?, error: Error?) -> Void in
            if user != nil{
                self.Activity.stopAnimating();
                self.Activity.isHidden = true;

                print("Successful Logged In.")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else{
                self.Activity.stopAnimating();
                self.Activity.isHidden = true;
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert);
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                print(error?.localizedDescription as Any);
                self.present(alert,animated: true);
            }
            
        })
        
        
        
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
