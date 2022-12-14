//
//  PetsTableViewDelegate.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/14/22.
//

import Foundation
import UIKit

class PetsTableViewDelegate<T> : NSObject, UITableViewDelegate {
    
    // MARK: - Declarations
    private var items : [T]!
    var didSelectRowAt : (T) -> () = {_ in }
    
    // MARK: - Init Method
    init(items : [T], didSelectRowAt : @escaping (T) -> ()) {
        self.items =  items
        self.didSelectRowAt = didSelectRowAt
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        self.didSelectRowAt(item)
    }
}
