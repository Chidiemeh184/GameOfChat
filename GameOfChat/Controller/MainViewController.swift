//
//  ViewController.swift
//  GameOfChat
//
//  Created by Chidi Emeh on 6/2/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleLougout))
    }

    
    @objc func handleLougout(){
        let loginController = LoginController()
        self.present(loginController, animated: true, completion: nil)
    }

}

