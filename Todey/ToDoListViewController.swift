//
//  ViewController.swift
//  Todey
//
//  Created by Shanu Wije on 4/13/19.
//  Copyright © 2019 Shanu Wije. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    var itemArray = ["get milk",  "get movie", "play chello", "Be Amazing"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Add Item", style: .default) { (action) in
            print(textField.text!)
            self.itemArray.append(textField.text!)
            //what will happen when the user clicks on the item
            self.tableView.reloadData()
        }
        
        //adding a text field inside the alert
        alert.addTextField { (alertTextField) in
            //adding a place holder grey text
            alertTextField.placeholder = "Add new Item"
            textField = alertTextField

        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

