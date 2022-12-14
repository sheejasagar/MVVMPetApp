//
//  PetsTableViewDataSource.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/14/22.
//

import Foundation
import UIKit

class PetTableViewDataSource<CELL : UITableViewCell,T> : NSObject, UITableViewDataSource {
    
    // MARK: - Declarations
    private var cellIdentifier : String!
    private var items : [T]!
    var configureCell : (CELL, T) -> () = {_,_ in }
    
    // MARK: - Init Method
    init(cellIdentifier : String, items : [T], configureCell : @escaping (CELL, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CELL
        cell.accessoryType = .disclosureIndicator
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
