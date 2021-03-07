//
//  ContactsViewController.swift
//  agendaContactos
//
//  Created by user177974 on 06/03/2021.
//

import Foundation
import UIKit



class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //vinculo la tabla al viewcontroler
    @IBOutlet weak var table: UITableView!
    
    var array:[DataContacts]? = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        showContacts()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    
    //numero de celdas de la tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var number = array?.count ?? 0
        
        return number
    }
    
    //Contenido de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        var datacell = self.array?[indexPath.row]
        
        cell.labelName.text = datacell?.contactName
        cell.labelPhone.text = String(datacell?.contactPhone ?? 0)
        cell.labelEmail.text = datacell?.contactEmail
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let defaults = UserDefaults.standard
        
        var datacell = self.array?[indexPath.row]
        
        let editName = datacell?.contactName
        let editPhone = datacell?.contactPhone
        let editEmail = datacell?.contactEmail
        let id = datacell?.contactName
        
        defaults.setValue(editName, forKey: "name")
        defaults.setValue(editPhone, forKey: "phone")
        defaults.setValue(editEmail, forKey: "email")
        defaults.setValue(id, forKey: "id")
        
        self.performSegue(withIdentifier: "editContact", sender: EditContactsViewController.self)
    }
    
    
    
    
    func showContacts(){
        
        NetworkController.shared.showContacts(completionHandler: {
            success in
            
                if success{
                    
                    print("Peticion de mostrar contactos realizada con exito, 200")
                    
                    self.array = NetworkController.shared.contactArray as? [DataContacts]
                    
                    self.table.reloadData()
                    
                }else{
                    
                    print("no se han podido mostrar contactos, 400")
                    
                }
        })
    }
    
  
    
    
    
}
