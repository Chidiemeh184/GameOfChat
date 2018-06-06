//
//  NewMessageController.swift
//  GameOfChat
//
//  Created by Chidi Emeh on 6/5/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import Firebase

class NewMessageController: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCnacel))
        
        fetchUser()
    }
    
    func fetchUser(){
        
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            //
        }) { (error) in
            //
        }
    }
    
    @objc func handleCnacel(){
        dismiss(animated: true, completion: nil)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "Cell"
        return cell
    }



}
