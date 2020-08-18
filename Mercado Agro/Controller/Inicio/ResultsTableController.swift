//
//  ResultsTableController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/9/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class ResultsTableController: InicioRootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View background.
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.tableView.separatorStyle = .none
        
        let nibHistory = UINib(nibName: "HistoryCell", bundle: nil)
        tableView.register(nibHistory, forCellReuseIdentifier: historyViewCellIdentifier)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        if !searching {
            rows = history.count
            print(history ?? 0, "rows func")
        } else {
            rows = filteredProducts.count
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let res: UITableViewCell!
        
        if !searching {
            let nibHistory = UINib(nibName: "HistoryCell", bundle: nil)
            tableView.register(nibHistory, forCellReuseIdentifier: historyViewCellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: historyViewCellIdentifier)! as UITableViewCell
            cell.accessoryType = .detailDisclosureButton
            cell.textLabel?.text = history[indexPath.row]
            //cell.accessoryView = UIImageView(image: UIImage(systemName: "multiply"))
            //cell.accessoryView?.tintColor = UIColor.black
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            cell.selectedBackgroundView = UIView()
            
            res = cell
        } else {
            let nib = UINib(nibName: "TableCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")! as UITableViewCell
            cell.textLabel?.text = filteredProducts[indexPath.row].titulo
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            cell.selectedBackgroundView = UIView()
            
            res = cell
        }
        return res
    }
    
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    // Clears selected history search.
        history.remove(at: indexPath.row)
        defaults.removeObject(forKey: "History")
        defaults.set(history, forKey: "History")
        
        tableView.reloadData()
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
