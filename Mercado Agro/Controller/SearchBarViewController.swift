//
//  SearchBarViewController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/9/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class SearchBarViewController: UITableViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    let tableViewCellIdentifier = "cellID"

    var products = Productos()
    var searchControler = UISearchController()
    private var resultsTableController: ResultsTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
        resultsTableController =
        self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
        // This view controller is interested in table view row selections.
        resultsTableController.tableView.delegate = self
        
        searchControler = UISearchController(searchResultsController: resultsTableController)
        searchControler.delegate = self
        searchControler.searchResultsUpdater = self
        searchControler.searchBar.autocapitalizationType = .none
        // searchControler.obscuresBackgroundDuringPresentation = false
        searchControler.searchBar.delegate = self
        
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchControler
        
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        
        /** Search presents a view controller by applying normal view controller presentation semantics.
            This means that the presentation moves up the view controller hierarchy until it finds the root
            view controller or one that defines a presentation context.
        */
        
        /** Specify that this view controller determines how the search controller is presented.
            The search controller should be presented modally and match the physical size of this view controller.
        */
        definesPresentationContext = true
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.productos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = products.productos[indexPath.row].producto
        
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension SearchBarViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: searchController)
    }
    
}

