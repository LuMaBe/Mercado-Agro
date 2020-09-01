//
//  ResultsScreen.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: ResultsScreen setup.

import UIKit

class ResultsScreen: HomeScreen {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View background.
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.tableView.separatorStyle = .none
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        
        if !SearchController.searching {
            rows = History.recentSearches.count
        } else {
            rows = FilteredProducts.filteredList.count
        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let res: UITableViewCell!
        
        if !SearchController.searching {
            tableView.register(UINib.init(nibName: HistoryTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: HistoryTableViewCell.cellIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.cellIdentifier, for: indexPath) as! HistoryTableViewCell
            
            // ClearCellAction Protocol.
            cell.selectionDelegate = self
            
            cell.selectionStyle = .none
            cell.lbTitle.text = History.recentSearches[indexPath.row]
            cell.clearButton.tag = indexPath.row
            tableView.separatorColor = UIColor.clear
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            cell.selectedBackgroundView = UIView()
            
            res = cell
        } else {
            let nib = UINib(nibName: "TableCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: Identifiers.tableCell)
            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.tableCell)! as UITableViewCell
            cell.textLabel?.text = FilteredProducts.filteredList[indexPath.row].titulo
            cell.backgroundColor = .clear
            cell.backgroundView = UIView()
            cell.selectedBackgroundView = UIView()
            
            res = cell
        }
        return res
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
