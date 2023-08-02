//
//  ViewControllerAllPosts.swift
//  Networking
//
//  Created by Andrew Sagatelov on 27.07.2023.
//

import UIKit

class ViewControllerAllPosts: UIViewController {
    
    @IBOutlet weak var allPostsTableView: UITableView! {
        didSet {
            allPostsTableView.delegate = self
            allPostsTableView.dataSource = self
            
            let xib = UINib(nibName: "TableViewCell", bundle: nil)
            allPostsTableView.register(xib, forCellReuseIdentifier: "TableViewCellXib")
        }
    }
    
    var usersPostsForTableArray: [Posts] = [] {
        didSet {
            print(usersPostsForTableArray)
            if oldValue.isEmpty != true {
                allPostsTableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addNewPost() {
        var addPostBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(performAddPostBarButtonItem))
        navigationItem.rightBarButtonItem = addPostBarButton
    }
    
    @objc func performAddPostBarButtonItem() {
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storboard.instantiateViewController(withIdentifier: "ViewControllerAddNewPostScreenID")
        show(vc, sender: self)
    }
}



extension ViewControllerAllPosts: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersPostsForTableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellXib", for: indexPath) as! TableViewCell
        
        cell.configure(data: usersPostsForTableArray[indexPath.row])
        
        return cell
    }
    
    
}
