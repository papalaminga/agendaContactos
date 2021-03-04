//
//  RegisterViewController.swift
//  boilerplate
//
//  Created by user177974 on 19/10/2020.
//


import UIKit

class RegisterViewController: UIViewController{
    
    
    
    
    @IBOutlet weak var boxNameRegister: UITextField!
    
    @IBOutlet weak var boxEmailRegister: UITextField!
    
    @IBOutlet weak var boxPasswordRegister: UITextField!
    
    @IBOutlet weak var boxRepPasswordRegister: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    
    @IBAction func Register(_ sender: Any) {
        
        NetworkController.shared.register(name: boxNameRegister.text!, email: boxEmailRegister.text!, password: boxPasswordRegister.text!, password_confirmation: boxRepPasswordRegister.text!)
    }
    
}
