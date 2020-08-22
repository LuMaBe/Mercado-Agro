//
//  MASearchController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit
/*
// MARK: SearchController for InicioRootViewController & ResultsTableController.
class SearchController: UISearchController, UISearchControllerDelegate, UISearchBarDelegate {
    
    var searchController = UISearchController()
    var resultsTableController: ResultsTableController!
    
    init
    
    // Setup the searchController & searchBar.
    func setup() {
        resultsTableController = self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = (resultsTableController!)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    // Makes the SearchBar customized with my settings.
    func customizedSearchBar() {
        
        navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
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
    
    // Makes the NavigationBar transparent.
    func transparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: "navigationBackground"), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
}

/* POR SI MÁS ADELANTE PINTA ALGÚN OTRO CAMBIO EN EL DISEÑO DE LA SEARCH BAR...

Custom Search Icon:
searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)

Custom Clear Icon:
searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)

*/
*/
