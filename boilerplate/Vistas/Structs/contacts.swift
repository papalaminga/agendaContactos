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
    
    public func getName() -> String {
            return self.contactName
        }
    
    public func getPhone() -> Int {
        return self.contactPhone
    }
    
    public func getEmail() -> String {
        return self.contactEmail
    }

}



    

    
/*struct addContact: Encodable {
    
    let contact_name: String
    let contact_phone: Int
    let contact_email: String
}*/
