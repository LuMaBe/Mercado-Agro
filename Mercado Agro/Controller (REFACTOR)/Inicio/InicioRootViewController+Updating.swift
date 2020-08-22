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
        if let checkDefault = defaults.stringArray(forKey: UserDefaultKeys.history) {
            History.recentSearches = checkDefault
        } else {
            History.recentSearches = []
        }
        History.recentSearches.append(text)
        defaults.set(History.recentSearches, forKey: UserDefaultKeys.history)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        searchController.searchResultsController?.view.isHidden = false
        findMatches(searchController.searchBar, textDidChange: searchText)
        if let checkDefault = defaults.stringArray(forKey: UserDefaultKeys.history) {
            History.recentSearches = checkDefault
        }
        print(History.recentSearches ?? 0, "update")
        
        tableView.reloadData()
    }
    
}
