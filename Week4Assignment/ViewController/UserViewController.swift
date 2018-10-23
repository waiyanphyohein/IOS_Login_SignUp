//
//  UserViewController.swift
//  Week4Assignment
//
//  Created by WaiYanPhyo Hein on 10/20/18.
//  Copyright © 2018 WaiYanPhyo Hein. All rights reserved.
//

import UIKit
import Parse;


class UserViewController: UIViewController {

    @IBOutlet weak var TitleField: UINavigationItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        TitleField.title = PFUser.current()?.username?.uppercased();
        // Do any additional setup after loading the view.
    }
    

    @IBAction func logOutAction(_ sender: Any) {
        PFUser.logOutInBackground(block: { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Successful loggout")
                // Load and show the login view controller
                self.performSegue(withIdentifier: "gotoLogin", sender: nil);
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
