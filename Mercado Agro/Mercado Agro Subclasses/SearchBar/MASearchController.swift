//
//  MASearchController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

// MARK: SearchController Style for InicioRootViewController & ResultsTableController.
class SearchController: UISearchController, UISearchControllerDelegate, UISearchBarDelegate {
    static var searching: Bool!

    // Setup the searchController & searchBar.
    func setup(searchController: UISearchController, resultsTableController: ResultsScreen) {
        searchController.searchResultsUpdater = (resultsTableController)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    // Makes the SearchBar customized with my settings.
    func customizedSearchBar(searchController: UISearchController) {
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            textfield.layer.cornerRadius = 15.0
            textfield.font = UIFont.systemFont(ofSize: CGFloat(13))
            textfield.layer.masksToBounds = true
        }
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.barTintColor = UIColor.white
        searchController.searchBar.tintColor = .black
        searchController.searchBar.placeholder = "Buscar en Mercado Agro"
        searchController.searchBar.isTranslucent = true
        searchController.searchBar.searchBarStyle = .minimal
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.autocapitalizationType = .none
    }
}

/*extension SearchController: UISearchResultsUpdating {
 
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
 let text = searchBar.text!
 print(text)
 if let checkDefault = HistoryUserDefaults.defaults.stringArray(forKey: UserDefaultKeys.historyUserDefaults) {
 History.recentSearches = checkDefault
 } else {
 History.recentSearches = []
 }
 History.recentSearches.append(text)
 HistoryUserDefaults.defaults.set(History.recentSearches, forKey: UserDefaultKeys.historyUserDefaults)
 }
 
 func updateSearchResults(for searchController: UISearchController) {
 let searchText = searchController.searchBar.text!
 
 searchController.searchResultsController?.view.isHidden = false
 findMatches(searchController.searchBar, textDidChange: searchText)
 if let checkDefault = HistoryUserDefaults.defaults.stringArray(forKey: UserDefaultKeys.historyUserDefaults) {
 History.recentSearches = checkDefault
 }
 print(History.recentSearches ?? 0, "update")
 
 tableView.reloadData()
 }
 }*/

/* POR SI MÁS ADELANTE PINTA ALGÚN OTRO CAMBIO EN EL DISEÑO DE LA SEARCH BAR...
 
 Custom Search Icon:
 searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)
 
 Custom Clear Icon:
 searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)
 
 */
