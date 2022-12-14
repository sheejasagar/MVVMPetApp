//
//  JsonParserHelper.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import Foundation

class JsonParserHelper: NSObject {
    
    // MARK: - Constants
    private static let kFilePets      =  "pets_list"
    private static let kFileConfig    =  "config"
    private static let kFileTypeJson  =  "json"
    
    // MARK: - Custom Method
    static private func readLocalFile(_ filename: String, _ type: String = kFileTypeJson) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: type) else { return nil }
        
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            return nil
        }
    }
    
    static private func loadJson<T : Decodable>(from data : Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    static func loadPetsData() -> Pets? {
        if let data = readLocalFile(kFilePets) {
            let pets : Pets = try! loadJson(from: data)
            return pets
        }
        return nil
    }
    
    static func loadConfigData() -> Config? {
        if let data = readLocalFile(kFileConfig) {
            let settings : Config = try! loadJson(from: data)
            return settings
        }
        return nil
    }
    
}
