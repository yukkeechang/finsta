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
    
    @IBAction func logoutButton(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            self.dismiss(animated: true, completion: nil)
            print ("logged out")
            
       }
    }
    
    //lets image be captured by the UIImagePickerController
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            toPostImage = image
            uploadPicView.image = toPostImage
        //sets selected image to my image view...even if the image format is unknown
        }
        //if this line is taken out, above function won't run..it says when you get the image on to your image view, go back to loginVC..but I'm only brought back to loginVC after I click post
        //Is this the reason why my publishPost won't run? Probably not
         self.dismiss(animated: true, completion: nil)
        
        //need this instead to go to homeTimeline and should go in the publishPost func instead
        //self.performSegue(withIdentifier: "backToHome", sender: self)
        
    }
    @IBAction func publishPost(_ sender: Any) {
        Post.postUserImage(image: toPostImage, caption: captionTextView.text ) { (success: Bool?, error: Error?) in
            if success! {
                print("picture on database")
                //bring me back to log in page if post is successful
                self.dismiss(animated: true, completion: nil)
                //bring me back to hometimeline if post is successful
                //self.performSegue(withIdentifier: "backToHome", sender: self)
            } else {
                print("error in publishing post is : \(error?.localizedDescription)")
            }
        }
       

    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

   

}
