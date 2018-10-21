//
//  SignUpViewController.swift
//  Week4Assignment
//
//  Created by WaiYanPhyo Hein on 10/20/18.
//  Copyright © 2018 WaiYanPhyo Hein. All rights reserved.
//

import UIKit;
import Parse;

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var UserNameField: UITextField!
    @IBOutlet weak var PassWordField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func OnSubmit(_ sender: Any) {
        let newUser = PFUser();
        newUser.username = UserNameField.text;
        newUser.password = PassWordField.text;
        newUser.email = EmailField.text;
        newUser.signUpInBackground { (success: Bool
            , error: Error?) -> Void in
            if success{
                print("Created a new user.");
                self.performSegue(withIdentifier: "loginSegue", sender: nil);
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
                print("Error: "+(error?.localizedDescription)!);
                self.present(alert,animated: true);
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Seag = segue.destination as! UserViewController;
        Seag.TitleField.title = UserNameField.text;
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
