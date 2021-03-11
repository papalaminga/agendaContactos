//
//  contacts.swift
//  agendaContactos
//
//  Created by user177974 on 06/03/2021.
//

import Foundation

struct DataContacts: Codable{

    let id, userID: Int
    let contactName: String
    let contactPhone: Int
    let contactEmail: String

    enum CodingKeys: String, CodingKey {
        
        case id
        case userID = "user_id"
        case contactName = "contact_name"
        case contactPhone = "contact_phone"
        case contactEmail = "contact_email"
    }

}



    

    
