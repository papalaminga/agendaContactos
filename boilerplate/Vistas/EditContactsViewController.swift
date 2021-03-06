//
//  EditContactsViewController.swift
//  agendaContactos
//
//  Created by user177974 on 06/03/2021.
//

import Foundation
import UIKit

class EditContactsViewController: UIViewController{
    
    @IBOutlet weak var boxEditName: UITextField!
    
    @IBOutlet weak var boxEditPhone: UITextField!
    
    @IBOutlet weak var boxEditEmail: UITextField!
    
    @IBOutlet weak var buttonEditContact: UIButton!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaults = UserDefaults.standard
        var id = defaults.string(forKey: "id")
        var name = defaults.string(forKey: "name")!
        var phone = defaults.string(forKey: "phone")!
        var email = defaults.string(forKey: "email")!
        
        boxEditName.text = name
        boxEditPhone.text = phone
        boxEditEmail.text = email
        
        print(id)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func editContact(_ sender: Any) {
        let defaults = UserDefaults.standard
                
       
        
        NetworkController.shared.updateContact(contact_name: boxEditName.text!, contact_phone: boxEditPhone.text!, contact_email: boxEditEmail.text!, completionHandler: {
            
            success in
            
            if success{
                    
                print("peticion de editar usuario Aceptada, 200")
                
                
                self.performSegue(withIdentifier: "goContacts", sender: ContactsViewController.self)
                
                let alert = UIAlertController(title: "editado", message: "el usuario se ha actualizado", preferredStyle: .alert)
                    
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
                
                
                
            }else{
                
                let alert = UIAlertController(title: "Usuario no editado", message: "algo ha fallado", preferredStyle: .alert)
                    
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    
    @IBAction func DeleteContact(_ sender: Any) {
    }
    
    
    
}
