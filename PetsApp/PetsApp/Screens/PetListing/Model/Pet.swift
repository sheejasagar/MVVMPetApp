//
//  Employee.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import Foundation

//typealias Pets = [PetData]

// MARK: - PetList
struct Pets: Codable {
    let pets: [PetData]
}

// MARK: - Pet
struct PetData: Codable {
    let imageURL: String
    let title: String
    let contentURL: String
    let dateAdded: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case title
        case contentURL = "content_url"
        case dateAdded = "date_added"
    }
}


