//
//  TableViewCell.swift
//  Networking
//
//  Created by Andrew Sagatelov on 31.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bodyLable: UILabel!
    


    func configure(data: Posts) {
        titleLable.text = data.title
        bodyLable.text = data.body
    }
    
}
