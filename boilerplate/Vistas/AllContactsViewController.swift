//
//  AllContactsViewController.swift
//  agendaContactos
//
//  Created by user177974 on 10/03/2021.
//

import Foundation
import UIKit

class AllContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var allTable: UITableView!
    
    var arrayAlContacts:[DataContacts]? = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        showAllContacts()
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        allTable.dataSource = self
        allTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var allNumber = arrayAlContacts?.count ?? 0
        
        return allNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "allCell") as! TableViewCell
        
        let datacell = self.arrayAlContacts?[indexPath.row]
        
        cell.allName.text = datacell?.contactName
        cell.allPhone.text = String(datacell?.contactPhone ?? 0)
        cell.allEmail.text = datacell?.contactEmail
        
        return cell
    }
    
    func showAllContacts(){
        
        NetworkController.shared.showAllContacts(completionHandler: {
            
            success in
            
                if success{
                    
                    print("peticion de mostrar todos los usuarios realizada con exito, 200")
                    
                    self.arrayAlContacts = NetworkController.shared.allContactArray as? [DataContacts]
                    
                    self.allTable.reloadData()
                    
                }else{
                    
                    print("peticion de mostrar todos los usuarios no realiza, 400")
                
                }
        })
    }
    
    
}
