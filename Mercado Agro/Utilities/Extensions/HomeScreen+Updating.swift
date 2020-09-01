//
//  HomeScreen+Updating.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/23/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: HomeScreen's 'searchBar' updating process.

import UIKit

extension HomeScreen: UISearchResultsUpdating {
    
    private func findMatches(_ searchBar: UISearchBar, textDidChange searchText: String) {
    // Search Algorithm.
        if searchText.isEmpty {
            SearchController.searching = false
            tableView.reloadData()
        } else {
            FilteredProducts.filteredList = ListaProductos.productos.filter{ $0.titulo.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil}
            SearchController.searching = true
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    // History: saves recent searches in UserDefaults.
        let text = searchBar.text!.lowercased()
        print(text)
        if let checkDefault = HistoryUserDefaults.defaults.stringArray(forKey: UserDefaultKeys.historyUserDefaults) {
            History.recentSearches = checkDefault
        } else {
            History.recentSearches = []
        }
        History.recentSearches.append(text)
        HistoryUserDefaults.defaults.set(History.recentSearches, forKey: UserDefaultKeys.historyUserDefaults)
        searchBar.text = ""
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        searchController.searchResultsController?.view.isHidden = false
        findMatches(searchController.searchBar, textDidChange: searchText)
        if let checkDefault = HistoryUserDefaults.defaults.stringArray(forKey: UserDefaultKeys.historyUserDefaults) {
            History.recentSearches = checkDefault
        }        
        tableView.reloadData()
    }
}
