//
//  ChangePasswordViewController.swift
//  agendaContactos
//
//  Created by user177974 on 07/03/2021.
//

import Foundation
import UIKit

class ChangePasswordViewController: UIViewController{

    @IBOutlet weak var boxChangePass: UITextField!
    
    @IBOutlet weak var buttonRecoverPass: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }
    
    @IBAction func recoverPass(_ sender: Any) {
        
        print("Petición de recuperar contraseña enviada")
        
        NetworkController.shared.recoverPass(email: boxChangePass.text!, completionHandler: {
        
            success in
            
            if success{
                
                print("peticion de recuperar contraseña aceptada, 200")
                
                let alert = UIAlertController(title: "solicitud aceptada", message: "revisa la bandeja de tu correo electronico", preferredStyle: .alert)
                        
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                self.present(alert, animated: true, completion: nil)
                
                DispatchQueue.global().sync {
                    do{
                        self.performSegue(withIdentifier: "recoverToLogin", sender: nil)
                    }catch {
                        }
                }
                
            }else{
                
                print("peticion de recuperar contraseña denegada, 400")
                
                let alert = UIAlertController(title: "solicitud denegada", message: "Opss algo a ido mal, vuelve a intentarlo", preferredStyle: .alert)
                        
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                self.present(alert, animated: true, completion: nil)
            }
        
        })
    }
}
