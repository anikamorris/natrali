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
    
    var categories:[String] = ["Complexion", "Eyes", "Brows", "Lips", "Full Face Tutorials"]
    var category:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        
        if let category = cell.categoryLabel {
            category.text = categories[indexPath.row]
        } else {
            return cell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = categories[indexPath.row]
        self.category = category
        
        performSegue(withIdentifier: "toAllVideos", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toAllVideos" {
            let vc = segue.destination as! DisplayVideosViewController
            vc.category = self.category
        }
    }
}
