//
//  Config.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import Foundation

// MARK: - Welcome
struct Config: Codable {
    let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
    let workHours: String
}
