//
//  AddContactsViewController.swift
//  boilerplate
//
//  Created by user177974 on 02/03/2021.
//

import Foundation
import UIKit

class AddContactsViewController: UIViewController{
    
    
    @IBOutlet weak var InputNameContact: UITextField!
    
    @IBOutlet weak var InputPhoneContact: UITextField!
    
    @IBOutlet weak var inputEmailContact: UITextField!
    
    @IBOutlet weak var buttonAddContact: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func addContact(_ sender: Any) {
        
        print("peticion de añadir usuario enviada")
        
        let phone = Int(InputPhoneContact.text!)
        NetworkController.shared.addContact(contact_name: InputNameContact.text!, contact_phone: InputPhoneContact.text!, contact_email: inputEmailContact.text!, completionHandler:{
            
            
            success in
            
                if success{
                
                    print("peticion de añadir usuario Aceptada, 200")
                
                    //en caso de no realizar la peticion devolvemos un mensaje
                    let alert = UIAlertController(title: "Usuario añadido", message: "el usuario se ha añadido correctamente", preferredStyle: .alert)
                        
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                    self.present(alert, animated: true, completion: nil)
                
                }else{
                
                    print("peticion de añadir usuario Denegada, 400")
                
                    //en caso de no realizar la peticion devolvemos un mensaje
                    let alert = UIAlertController(title: "Usuario no añadido", message: "el usuario no se ha añadido, revisa los campos", preferredStyle: .alert)
                        
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                    self.present(alert, animated: true, completion: nil)
                }
            })
            
        cleanBox()
    }
    
    func alertEmptyBox(){
                
        if(!InputNameContact.hasText){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ningun nombre", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
            
        }
        
        if(!InputPhoneContact.hasText){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ningun telefono", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
        
        if(!inputEmailContact.hasText){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ningun email", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
    }
    
    func cleanBox(){
        
        InputNameContact.text = ""
        InputPhoneContact.text = ""
        inputEmailContact.text = ""
    }
}
