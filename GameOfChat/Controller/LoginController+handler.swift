//
//  LoginController+handler.swift
//  GameOfChat
//
//  Created by Chidi Emeh on 6/6/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

extension LoginController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func handleSelectProfileImageView(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Selection cancelled")
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
 
        if let editedImage = info["UIImagePickerControllerEditiedImage"] as? UIImage{
            print("Edited \(editedImage.size)")
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            print(originalImage.size)
        }
    }
    
}

