//
//  NetworkController.swift
//  boilerplate
//
//  Created by user177974 on 02/03/2021.
//

import Foundation
import Alamofire

class NetworkController{
    
    var apiToken: Any?
    var data:[DataContacts] = []
    var contactArray: Any = []
    
    //esta variable hace que pueda llamar a los metodos de la api
    static var shared: NetworkController = NetworkController()
    
    //funcion que recoge los datos necesarios para que un usuario pueda hacer loguin
    func login(email: String, password: String, completionHandler: @escaping(Bool)-> Void){
        
        //se estructuran los datos a mandar
        struct Login: Encodable {
            
            let email: String
            let password: String
        }
        
        //alamcenamos la URL de la api en una varianle
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/login")!
        //preparamos las variables a enviar
        let login: [String:Any] = ["email": email , "password": password]
        //las transformamos en JSON
        let jsonLogin = try? JSONSerialization.data(withJSONObject: login)
        //llamamos a la request, dandole la url
        var request = URLRequest(url: url)
        //se le indica el protocolo con el que se envia
        request.httpMethod = "POST"
        //se le indica el contenido del body
        request.httpBody = jsonLogin
        //el header
        request.headers = ["Content-Type": "application/json"]
        //se envia la peticion usando alamofire
        AF.request(request).responseDecodable(of: LoginToken.self){
            
            response in
            
            guard let loginResponse = response.value else {return}
    
            let defaults = UserDefaults.standard
    
            debugPrint(response)
            
            //con este if se comprueba le codigo devuleto con la peticion
            if ((response.response?.statusCode) != 200){
                completionHandler(false)
            }else{
                //to do acceder al acces token
                var token = response.value
                defaults.setValue(loginResponse.token, forKey: "token")
                completionHandler(true)
            }
        }
    }
    
    func register(name: String, email: String, password: String, password_confirmation: String, completionHandler: @escaping(Bool)-> Void){
        
        struct Register: Encodable {
            
            let name: String
            let email: String
            let password: String
            let password_confirmation: String
        }
        
        //alamcenamos la URL de la api en una varianle
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/register")!
        //preparamos las variables a enviar
        let register: [String:Any] = ["name": name, "email": email, "password": password, "password_confirmation": password_confirmation]
        //las transformamos en JSON
        let registerJson = try? JSONSerialization.data(withJSONObject: register)
        //llamamos a la request, dandole la url
        var request = URLRequest(url: url)
        //se le indica el protocolo con el que se envia
        request.httpMethod = "POST"
        //se le indica el contenido del body
        request.httpBody = registerJson
        //el header
        request.headers = ["Content-Type": "application/json"]
        
        //se envia la peticion usando alamofire
        AF.request(request).response  { response in
            
            debugPrint(response)
            
            //con este if se comprueba le codigo devuleto con la peticion
            if ((response.response?.statusCode) != 201){
                
                completionHandler(false)
                
            }else{
                
                
                completionHandler(true)
            }
            
        }
        
    }
    
    func showContacts(completionHandler: @escaping(Bool)-> Void)->[DataContacts]{
        
        let defaults = UserDefaults.standard
        
        let tokenApi = defaults.string(forKey: "token")!
        
        //llamamos a la url
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/showContact")!
        //se lanza la peticion
        var request = URLRequest(url: url)
        //se dice protocolo de envio que se va a usar
        request.httpMethod = "GET"
        //la informacion que se va a enviar por los headers
        request.headers = ["Content-Type": "application/json", "Authorization": "Bearer " + tokenApi]
        
        AF.request(request).responseDecodable(of: [DataContacts].self) { response in
            
            guard let contactResponse = response.value else {return}
            var dataContact = contactResponse
            debugPrint(response)
            
            //con este if se comprueba le codigo devuleto con la peticion
            if ((response.response?.statusCode) != 200){
                
                completionHandler(false)
                
            }else{
                var data = response.value!
                self.contactArray = data
                debugPrint(data)
                completionHandler(true)
            
            }
        }
        return data
    }
    
    func addContact(contact_name: String, contact_phone: String, contact_email: String, completionHandler:@escaping(Bool)-> Void){
        
        let defaults = UserDefaults.standard
        let tokenApi = defaults.string(forKey: "token")!
        
        struct addContact: Encodable {
            
            let contact_name: String
            let contact_phone: Int
            let contact_email: String
        }
        
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/create")!
        
        let newContact: [String:Any] = ["contact_name": contact_name, "contact_phone": contact_phone, "contact_email": contact_email]
        
        let registerJson = try? JSONSerialization.data(withJSONObject: newContact)
        
        //llamamos a la request, dandole la url
        var request = URLRequest(url: url)
        //se le indica el protocolo con el que se envia
        request.httpMethod = "POST"
        //se le indica el contenido del body
        request.httpBody = registerJson
        //el header
        request.headers = ["Content-Type": "application/json", "Authorization": "Bearer " + tokenApi]
        //se envia la peticion usando alamofire
        AF.request(request).response  { response in
            
            debugPrint(response)
            
            //con este if se comprueba le codigo devuleto con la peticion
            if ((response.response?.statusCode) != 200){
                
                completionHandler(false)
                
            }else{
                
                completionHandler(true)
            }
            
        }
    }
    
    func recoverPass(email: String, completionHandler: @escaping(Bool)-> Void){
        
        struct Recover: Encodable {
            
            let email: String
        }
        
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/password/email")!
        
        let recover: [String:Any] = ["email": email]
        
        let jsonLogin = try? JSONSerialization.data(withJSONObject: recover)
      
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.httpBody = jsonLogin
     
        request.headers = ["Content-Type": "application/json"]

        AF.request(request).response { response in
            
            debugPrint(response)
            
            if ((response.response?.statusCode) != 200){
                
                completionHandler(false)
                
            }else{
                
                completionHandler(true)
            }
            
        }
    }
    
    func updateContact(contact_name: String, contact_phone: String, contact_email: String, completionHandler:@escaping(Bool)-> Void){
    
        let defaults = UserDefaults.standard
        
        let tokenApi = defaults.string(forKey: "token")!
        
        let id = defaults.string(forKey: "id")!
        
        struct addContact: Encodable {
    
            let contact_name: String
            let contact_phone: Int
            let contact_email: String
        }
        
        
        
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/updateContact/"+id)!
        
        let editedContact: [String:Any] = ["contact_name": contact_name, "contact_phone": contact_phone, "contact_email": contact_email]
        
        let registerJson = try? JSONSerialization.data(withJSONObject: editedContact)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.httpBody = registerJson
        
        request.headers = ["Content-Type": "application/json", "Authorization": "Bearer " + tokenApi]
        
        AF.request(request).response  { response in
            
            debugPrint(response)
            
            if ((response.response?.statusCode) != 200){
                
                completionHandler(false)
                
            }else{
                
                completionHandler(true)
            }
            
        }
        
    }
}

