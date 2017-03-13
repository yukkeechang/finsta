//
//  postModel.swift
//  insta
//
//  Created by Yukkee chang on 3/12/17.
//  Copyright © 2017 Yukkee chang. All rights reserved.
//

import Foundation
import Parse

class Post: NSObject {
        
    
    
    class func postUserImage(image: UIImage?, withCompletion completion: @escaping PFBooleanResultBlock) {
            var caption : String?
            let post = PFObject(className: "Post")
            //reference this in the cell, then do the didSet method to get data from here
            
            post["media"] = getPFFileFromImage(image: image)
            post["caption"] = caption
            post["author"] = PFUser.current()
        //  caption =  post["caption"] as? String
        
            post.saveInBackground(block: completion)
        }
        
    
        //convert image to pff
        class func getPFFileFromImage(image: UIImage?) -> PFFile? {
            if let image = image {
            if let imageData = UIImagePNGRepresentation(image) {
                    return PFFile(name: "image.png", data: imageData)
                }
            }
            print("error in converting to pff file!")
            return nil
        }
        
    }

    
    /*var postCaption: String?
    var postUsername: String?
    var postPost: UIImage
    
    let table = PFObject(className: "user")
    
    table["caption"] = "caption" */
/*  */
