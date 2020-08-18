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
    // Search Algorithm.
        if searchText.isEmpty {
            searching = false
            tableView.reloadData()
        } else {
            filteredProducts = productos.lista.filter{ $0.titulo.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil}
            searching = true
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    // History: saves recent searches in UserDefaults.
        let text = searchBar.text!
        print(text)
        if let checkDefault = defaults.stringArray(forKey: "History") {
            history = checkDefault
        } else {
            history = []
        }
        history.append(text)
        defaults.set(history, forKey: "History")
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        searchController.searchResultsController?.view.isHidden = false
        findMatches(searchController.searchBar, textDidChange: searchText)
        if let checkDefault = defaults.stringArray(forKey: "History") {
            history = checkDefault
        }
        print(history ?? 0, "update")
        
        tableView.reloadData()
    }
    
}
