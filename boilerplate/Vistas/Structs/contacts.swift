//
//  contacts.swift
//  agendaContactos
//
//  Created by user177974 on 06/03/2021.
//

import Foundation

struct DataContacts:Decodable{
    
    let id: Int
    let user_id: Int
    let contact_name: String
    let contact_phone: Int
    let contact_email: String
    
}

/*struct addContact: Encodable {
    
    let contact_name: String
    let contact_phone: Int
    let contact_email: String
}*/
