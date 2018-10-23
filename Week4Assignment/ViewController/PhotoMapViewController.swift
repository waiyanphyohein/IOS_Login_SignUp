//
//  PhotoMapViewController.swift
//  Week4Assignment
//
//  Created by WaiYanPhyo Hein on 10/22/18.
//  Copyright © 2018 WaiYanPhyo Hein. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerController.SourceType.camera
        
        self.present(vc, animated: true, completion: nil)

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            vc.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            vc.sourceType = .photoLibrary
        }
       
        let photoLib = UIImagePickerController()
        photoLib.delegate = self
        photoLib.allowsEditing = true
        photoLib.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(photoLib, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }
    
  
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [String : Any]) {
//        // Get the image captured by the UIImagePickerController
//        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
//
//        // Do something with the images (based on your use case)
//
//        // Dismiss UIImagePickerController to go back to your original view controller
//        dismiss(animated: true, completion: nil)
//    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
