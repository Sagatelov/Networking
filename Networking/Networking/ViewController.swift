//
//  ViewController.swift
//  Networking
//
//  Created by Andrew Sagatelov on 26.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var statuResponseLabel: UILabel!
    
    var usersPosts: [Posts] = []
    var network = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func downloadPostsDidTap(_ sender: UIButton) {
        network.getAllPosts { arrayPosts in
            
            self.usersPosts = arrayPosts
            
            DispatchQueue.main.async {
                self.statuResponseLabel.text = "Download complition"
            }
        }
    }
}

