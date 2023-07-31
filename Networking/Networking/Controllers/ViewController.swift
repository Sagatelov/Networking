//
//  ViewController.swift
//  Networking
//
//  Created by Andrew Sagatelov on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statuResponseLabel: UILabel!
    
    var network = NetworkManager()
    
    var allPostsUserArray: [Posts] = [] {
        didSet {
            print(allPostsUserArray)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downloadPostsDidTap(_ sender: UIButton) {
        
        network.getAllPosts { arrayPosts in
            
            
            DispatchQueue.main.async {
                self.allPostsUserArray = arrayPosts
                self.statuResponseLabel.text = "Download complition"
            }
        }
        
        let allPostsBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(screenWithPostButton))
        
        navigationItem.rightBarButtonItem = allPostsBarButtonItem
        
    }
    
    @objc func screenWithPostButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewControllerAllPostsID")
        if let vcSave = vc as? ViewControllerAllPosts {
            
            vcSave.usersPostsForTableArray = allPostsUserArray
        }
        show(vc, sender: self)
    }
}


