//
//  ViewControllerAddNewPostScreen.swift
//  Networking
//
//  Created by Andrew Sagatelov on 01.08.2023.
//

import UIKit

class ViewControllerAddNewPostScreen: UIViewController {

    @IBOutlet weak var titleTextFild: UITextField!
    @IBOutlet weak var idTextFild: UITextField!
    @IBOutlet weak var DescriptionTextView: UITextView! {
        didSet {
            DescriptionTextView.text = "Введите текст"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    
    
}
