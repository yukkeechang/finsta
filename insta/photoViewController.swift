//
//  photoViewController.swift
//  insta
//
//  Created by Yukkee chang on 3/12/17.
//  Copyright © 2017 Yukkee chang. All rights reserved.
//

import UIKit
import Parse

class photoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var uploadPicView: UIImageView!

    var toPostImage: UIImage?
    let postImage = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.delegate = self

    }
    
    @IBAction func galleryButton(_ sender: Any) {
        postImage.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(postImage, animated: true, completion: nil)
    }
    
    
    @IBAction func cameraButton(_ sender: Any) {
        postImage.sourceType = UIImagePickerControllerSourceType.camera
        self.present(postImage, animated: true, completion: nil)
    }
    
    
    @IBAction func publishPost(_ sender: Any) {
        Post.postUserImage(image: toPostImage) { (success: Bool?, error: Error?) in
            if success! {
                print("picture on database")
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error in publishing post is : \(error?.localizedDescription)")
            }
        }
    }
   
     //lets image be captured by the UIImagePickerController
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            toPostImage = image
            uploadPicView.image = toPostImage
        }
        //dismisses view controller
        dismiss(animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
