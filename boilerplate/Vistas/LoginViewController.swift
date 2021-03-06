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
        
        //llamo a esta funcion para comprobar que los textfield tengan datos
        alertEmptyBox()
        
        //esta funcion se encargara de hacer una peticion cuando se pulse el boton
        NetworkController.shared.login(email: boxEmail.text!, password: boxPassword.text!, completionHandler: {
            success in
            
            print("Peticion de login enviada")
            
            //con esta condicion decimos que hacer en caso de que funcione y no funcione
            if success{
                
                print("la peticion de login se ha realizado correctamente, 200")
                
                //pasamos de forma sincrona el perfomsegue para que se cambie de pantalla cuando la peticion se haya realizado con exito
                DispatchQueue.global().sync {
                    do{
                        self.performSegue(withIdentifier: "loginToMain", sender: nil)
                    }catch {
                        }
                }
            }else{
                print("error al realizar la peticion de login")
                
                //en caso de no realizar la peticion devolvemos un mensaje
                let alert = UIAlertController(title: "Datos incorrectos", message: "los datos enviados no son validos", preferredStyle: .alert)
                        
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            
                self.present(alert, animated: true, completion: nil)
            }
        })
    }

    //funcion para crear una alerta en caso de que los textfield esten vacios
    func alertEmptyBox(){
                
        if(!boxEmail.hasText){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ningun email", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
            
        }
        
        if(!boxPassword.hasText){
            
            let alert = UIAlertController(title: "Login", message: "No has introducido ninguna contraseña", preferredStyle: .alert)
                    
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        
            present(alert, animated: true, completion: nil)
                    
        }
    }
}

