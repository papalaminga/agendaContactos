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
        
        alertEmptyBox()
        
        NetworkController.shared.register(name: boxNameRegister.text!, email: boxEmailRegister.text!, password: boxPasswordRegister.text!, password_confirmation: boxRepPasswordRegister.text!, completionHandler: {
            success in
            
            print("Peticion de registro enviada")
            
            //con esta condicion decimos que hacer en caso de que funcione y no funcione
            if success{
                
                print("la peticion de registro se ha realizado correctamente, 200")
                
                //pasamos de forma sincrona el perfomsegue para que se cambie de pantalla cuando la peticion se haya realizado con exito
                DispatchQueue.global().sync {
                    do{
                        self.performSegue(withIdentifier: "goToLogin", sender: nil)
                    }catch {
                        }
                }
            }else{
                print("error al realizar la peticion de registro")
                
                //en caso de no realizar la peticion devolvemos un mensaje
                let alert = UIAlertController(title: "Error", message: "comprueba tus datos o vuelvelo a intentar mas tarde", preferredStyle: .alert)
                        
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                self.present(alert, animated: true, completion: nil)
            }
        })
        
        cleanBox()
    }
    
    func alertEmptyBox(){
        
        if(!boxNameRegister.hasText){
            
            let alert = UIAlertController(title: "Name", message: "No has introducido ningun email", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
            
        }
                
        if(!boxEmailRegister.hasText){
            
            let alert = UIAlertController(title: "Email", message: "No has introducido ningun email", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
            
        }
        
        if(!boxPasswordRegister.hasText){
            
            let alert = UIAlertController(title: "Password", message: "No has introducido ninguna contraseña", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
        
        if(!boxRepPasswordRegister.hasText){
            
            let alert = UIAlertController(title: "Repeat password", message: "No has introducido ninguna contraseña", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
    }
    
    func cleanBox(){
        
        boxNameRegister.text = ""
        boxEmailRegister.text = ""
        boxPasswordRegister.text = ""
        boxRepPasswordRegister.text = ""
    }
}
