//
//  CategoryTableViewController.swift
//  natrali
//
//  Created by Anika Morris on 1/6/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation
import UIKit

class CategoryTableViewController: UITableViewController {
    
    var categories:[String] = ["Full face tutorials", "Complexion", "Eyes", "Brows", "Lips"]
    
    override func viewDidLoad() {

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO figure out why cell isn't conforming to CategoryTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        // cell.categoryLabel.text = categories[indexPath.row]
        if let category = cell.categoryLabel {
            category.text = categories[indexPath.row]
        } else {
            return cell
        }
        // cell.categoryLabel.text = "Category"
        
        return cell
    }
}
