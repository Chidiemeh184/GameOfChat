//
//  ViewController.swift
//  GameOfChat
//
//  Created by Chidi Emeh on 6/2/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        let ref :  DatabaseReference = Database.database().reference()
//        ref.updateChildValues(["Some" : 12334])
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleLougout))
    }

    
    @objc func handleLougout(){
        let loginController = LoginController()
        self.present(loginController, animated: true, completion: nil)
    }

}

