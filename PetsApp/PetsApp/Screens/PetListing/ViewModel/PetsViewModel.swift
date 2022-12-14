//
//  PetsViewModel.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import Foundation

class PetsViewModel : NSObject {
    
    // MARK: - Declarations
    private var apiService : APIService!
    private(set) var petData : Pets! {
        didSet {
            DispatchQueue.main.async {
                self.loadPetList()
            }
        }
    }
    
    var loadPetList : (() -> ()) = {}
    
    // MARK: - Init Methods
    override init() {
        super.init()
        self.apiService =  APIService()
        getPetsData()
    }
    
    // MARK: - Custom Methods
    func getPetsData() {
        self.apiService.getPetsData { (petData) in
            self.petData = petData
        }
    }
    
    func isValidateWorkHours() -> Bool  {
        if Utility.isHoliday() || !Utility.isWorkHour() {
            return false
        }else {
            return true
        }
    }
}
