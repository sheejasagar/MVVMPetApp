//
//  APIService.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import UIKit

class APIService :  NSObject {
    
    // MARK: - Constants
    //    private let petListURL = URL(string: "https://mocki.io/v1/17b6f022-f2cc-44c4-b8f0-a66ed11846e2")!
    
    // MARK: - Custom Methods
    //    func getPetsData(completion : @escaping (Pets) -> ()) {
    //        URLSession.shared.dataTask(with: petListURL) { (data, urlResponse, error) in
    //            if let data = data {
    //                let jsonDecoder = JSONDecoder()
    //                let response = try! jsonDecoder.decode(Pets.self, from: data)
    //                completion(response)
    //            }
    //        }.resume()
    //    }
    
    func getPetsData(completion : @escaping (Pets) -> ()) {
        if let response = JsonParserHelper.loadPetsData() {
            completion(response)
        }
    }
    
}
