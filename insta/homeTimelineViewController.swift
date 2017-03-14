//
//  homeTimelineViewController.swift
//  insta
//
//  Created by Yukkee chang on 3/12/17.
//  Copyright © 2017 Yukkee chang. All rights reserved.
//

import UIKit
import Parse

class homeTimelineViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts: [PFObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        getPosts()
        
    }
    //try it with a view did appear function too
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //putting the posts in order
    func getPosts () {
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        
        
        //checking to see if a insta post in general exists
        query.findObjectsInBackground (block: { (posts: [PFObject]?, error: Error?) -> Void in
            query.limit = 20
            if let posts = posts {
                self.posts = posts
                print(self.posts)
                self.tableView.reloadData()
            } else {
                print ("error in query: \(error?.localizedDescription)")
            }
        })
    }
    @IBAction func logoutButton(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            print ("logged out")
        }
        //bring you to sign up page
        self.performSegue(withIdentifier: "logout", sender: nil)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            return posts.count
        } else { return 0
        } //if no post(s), cell count is 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postCell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath as IndexPath) as! postCell
        let post = posts![indexPath.row]
        postCell.post = post
        //postCell.captionTextField = posts.caption
        // postCell.post = self.posts[indexPath.row] is basically the same thing
        
        return postCell
        
    }
    
    
    
}





