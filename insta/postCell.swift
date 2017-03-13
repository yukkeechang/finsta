//
//  postCell.swift
//  insta
//
//  Created by Yukkee chang on 3/12/17.
//  Copyright © 2017 Yukkee chang. All rights reserved.
//

import UIKit
import Parse
class postCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    var post: PFObject! {
        didSet{
            
            if let postImg = post["media"] as? PFFile {
                postImg.getDataInBackground(block: { (imageData: Data?, error: Error?) in
                    if let imageData = imageData {
                        self.postImage.image = UIImage.init(data: imageData)
            
                    }
                    

                })
            
            }
      
         }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
