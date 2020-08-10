//
//  SearchBarViewController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/9/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class SearchBarViewController: UITableViewController, UISearchControllerDelegate {
    
    // Variable Declarations.
    
    private var resultsTableController: ResultsTableController!
    var products = Productos()
    var searchController = UISearchController()
    let tableViewCellIdentifier = "cellID"
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
        resultsTableController =
        self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
        
        // This view controller is interested in table view row selections.
        resultsTableController.tableView.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.barTintColor = UIColor.white
        searchController.searchBar.delegate = self
        
        // Place the SearchBar in the navigation bar.
        navigationItem.titleView = searchController.searchBar
        
        // Make the SearchBar always visible.
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Customized SearchBar.
        //navigationItem.titleView?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            textfield.layer.cornerRadius = 15.0
            textfield.font = UIFont.systemFont(ofSize: CGFloat(13))
            textfield.layer.masksToBounds = true
        }
        searchController.searchBar.backgroundColor = #colorLiteral(red: 0.2105133832, green: 0.3697865903, blue: 0.04452704638, alpha: 1)
        searchController.searchBar.tintColor = .black
        searchController.searchBar.placeholder = "Buscar en Mercado Agro"
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.searchBarStyle = .minimal
        
        /* POR SI MÁS ADELANTE PINTA ALGÚN CAMBIO EN EL DISEÑO DE LA SEARCH BAR...
        
        Custom Search Icon:
        searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)
        
        Custom Clear Icon:
        searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)

        */
        
        // Customized Navigation Bar.
        
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.barTintColor = #colorLiteral(red: 0.2105133832, green: 0.3697865903, blue: 0.04452704638, alpha: 1)
        }
        self.navigationController!.navigationBar.isTranslucent = false
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")! as UITableViewCell
        cell.textLabel?.text = products.productos[indexPath.row].producto
        
        // Dejo transparente el fondo de las celdas.
        cell.backgroundColor = .clear
        cell.backgroundView = UIView()
        cell.selectedBackgroundView = UIView()
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension SearchBarViewController: UISearchBarDelegate {
    
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: searchController)
    }
    
}

