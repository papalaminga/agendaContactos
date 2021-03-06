//
//  ContactsViewController.swift
//  boilerplate
//
//  Created by user177974 on 02/03/2021.
//

import Foundation
import UIKit

class contactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    @IBOutlet weak var tableContact: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableContact.delegate = self
        tableContact.dataSource = self
    }
    
  
    
}
