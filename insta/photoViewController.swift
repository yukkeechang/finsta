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
    
    
    //lets image be captured by the UIImagePickerController
    // Why is it string but not UIImage
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            toPostImage = image
            uploadPicView.image = toPostImage //this basically sets that selected image to my image view...even if the image format is unknown and an error!
        }
        //if I take this line out, my function above won't run
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func publishPost(_ sender: Any) {
        Post.postUserImage(image: toPostImage, caption: captionTextView.text ) { (success: Bool?, error: Error?) in
            if success! {
                print("picture on database")
                //bring me back to log in page if post is successful
                self.dismiss(animated: true, completion: nil)
            } else {
                print("error in publishing post is : \(error?.localizedDescription)")
            }
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
