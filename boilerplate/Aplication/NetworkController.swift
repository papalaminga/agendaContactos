//
//  NetworkController.swift
//  boilerplate
//
//  Created by user177974 on 02/03/2021.
//

import Foundation
import Alamofire

class NetworkController{
    
    //esta variable hace que pueda llamar a los metodos de la api
    static var shared: NetworkController = NetworkController()
    
    //funcion que recoge los datos necesarios para que un usuario pueda hacer loguin
    func login(email: String, password: String){
        
        //se estructuran los datos a mandar
        struct Login: Encodable {
            
            let email: String
            let password: String
        }
        
        //alamcenamos la URL de la api en una varianle
        let url = URL(string: "https://conctactappservice.herokuapp.com/api/login")!
        
        //preparamos las variables a enviar
        let login: [String:Any] = ["email": email , "password": password]
        
        print(login)
        
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
        AF.request(request).responseJSON { response in
            
            debugPrint(response)
            
        }
        
    }
    
    func register(name: String, email: String, password: String, password_confirmation: String){
        
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
        
        print(register)
        
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
            
        }
    }
    
    
    
    
    
}

