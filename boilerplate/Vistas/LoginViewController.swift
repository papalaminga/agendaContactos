//
//  LoginViewController.swift
//  boilerplate
//
//  Created by user177974 on 19/10/2020.
//


import UIKit


class LoginViewController: UIViewController{
    
    
    @IBOutlet weak var boxEmail: UITextField!
    
    
    @IBOutlet weak var boxPassword: UITextField!
    
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    
    @IBOutlet weak var buttonRegister: UIButton!
    
    
    override func viewDidLoad() {
    
        
        
        super.viewDidLoad()
        
        var valorEmail: String = boxEmail.text!
        
        var valorPassword: String = boxPassword.text!;
        
        }
    
    
    @IBAction func login(_ sender: Any){
        
        if (boxEmail == nil || boxPassword == nil ){
            
            alertEmptyBox()
        }
        
        NetworkController.shared.login(email: boxEmail.text!, password: boxPassword.text!)
        
        
    }

    
    func alertEmptyBox(){
                
        if(boxEmail.text == nil){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ningun email", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
            
        }
        
        if(boxPassword.text == nil){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ninguna contraseña", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
    }
}

