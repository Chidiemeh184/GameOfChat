//
//  ViewController.swift
//  GameOfChat
//
//  Created by Chidi Emeh on 6/2/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleLougout))
        
        let image = UIImage(named: "compose")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        
        checkIfUserIsLoggedIn()
    }
    
    @objc func handleNewMessage(){
        let newMessageController = NewMessageController()
        let navController = UINavigationController(rootViewController: newMessageController)
        present(navController, animated: true, completion: nil)
    }
    
    
    func checkIfUserIsLoggedIn(){
        
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLougout), with: nil, afterDelay: 0)
        }else{
            let uid = Auth.auth().currentUser?.uid
            Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject]{
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }) { (error) in
                print("Could not get user")
            }
        }
    }

    
    @objc func handleLougout(){
        do {
            try Auth.auth().signOut()
        }catch let error {
            print(error)
        }
        
        let loginController = LoginController()
        self.present(loginController, animated: true, completion: nil)
    }

}

