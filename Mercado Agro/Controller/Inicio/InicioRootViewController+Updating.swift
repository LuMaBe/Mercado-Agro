//
//  InicioRootViewController+Updating.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/13/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

extension InicioRootViewController: UISearchResultsUpdating {
    
    private func findMatches(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filteredProducts = productos.lista
            searching = false
        } else {
            filteredProducts = productos.lista.filter{ $0.titulo.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil}
            searching = true
        }
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchText = searchController.searchBar.text!
        
        searchController.searchResultsController?.view.isHidden = false
        findMatches(searchController.searchBar, textDidChange: searchText)
    }
    
}
