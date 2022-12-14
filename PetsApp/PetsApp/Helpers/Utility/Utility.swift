//
//  Utility.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/14/22.
//

import Foundation

class Utility: NSObject {
    
    // MARK: - Constants
    static let kFilePets      =  "pets_list"
    static let kFileConfig    =  "config"
    static let kFileTypeJson  =  "json"
    
    // MARK: - Init Method
    override private init() {
        fatalError("please don't init(). It's a static class")
    }
    
    // MARK: - Custom Method
    static func getDayName(_ date:Date = Date()) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    static func getHour(_ date:Date = Date()) -> Float {
        let hours = (Calendar.current.component(.hour, from: date))
        let minute = (Calendar.current.component(.minute, from: date))
        let time = "\(hours).\(minute)"
        return Float(time) ?? 0.0
    }
    
    static func isHoliday() -> Bool {
        let dayName = getDayName().uppercased()
        if dayName == "SUNDAY" ||  dayName == "SATURDAY" {
            return true
        }
        return false
    }
    
    static func isWorkHour() -> Bool {
        guard let cofig = JsonParserHelper.loadConfigData() else { return false }
        let workHours = cofig.settings.workHours
        let workHourStr = workHours.replacingOccurrences(of: ":", with: ".", options: .literal, range: nil)
        let hoursArray = workHourStr.components(separatedBy: " ")
        let result = hoursArray.compactMap({ Float($0) })
        if result.count > 1 {
            let hour   = getHour()
            if hour >= result[0] && hour <= result[1] {
                return true
            }
        }
        return false
    }
    
}


