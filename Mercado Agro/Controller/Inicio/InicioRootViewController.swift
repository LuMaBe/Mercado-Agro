//
//  InicioRootViewController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/10/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class InicioRootViewController: UIViewController, UISearchControllerDelegate {
    
    // Variable Declarations.
    private var resultsTableController: ResultsTableController!
    var searchController1 = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableController =
            self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
        
        searchController1 = UISearchController(searchResultsController: resultsTableController)
        searchController1.delegate = self
        searchController1.searchResultsUpdater = self
        searchController1.searchBar.autocapitalizationType = .none
        searchController1.obscuresBackgroundDuringPresentation = true
        searchController1.searchBar.barTintColor = UIColor.white
        searchController1.searchBar.delegate = self
        
        // Place the SearchBar in the navigation bar.
        navigationItem.titleView = searchController1.searchBar
        
        // Make the SearchBar always visible.
        searchController1.hidesNavigationBarDuringPresentation = false
        navigationItem.hidesSearchBarWhenScrolling = false
        
        // Customized SearchBar.
        //navigationItem.titleView?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        if let textfield = searchController1.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = .white
            textfield.layer.cornerRadius = 15.0
            textfield.font = UIFont.systemFont(ofSize: CGFloat(13))
            textfield.layer.masksToBounds = true
        }
        searchController1.searchBar.backgroundColor = .clear
        searchController1.searchBar.tintColor = .black
        searchController1.searchBar.placeholder = "Buscar en Mercado Agro"
        searchController1.searchBar.isTranslucent = true
        searchController1.searchBar.searchBarStyle = .minimal
        
        /* POR SI MÁS ADELANTE PINTA ALGÚN CAMBIO EN EL DISEÑO DEL SEARCH BAR...
         
         Custom Search Icon:
         searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)
         
         Custom Clear Icon:
         searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)
         
         */
        
        // Customized Navigation Bar.
        /*
        if let navigationbar = self.navigationController?.navigationBar {
            navigationbar.barTintColor = #colorLiteral(red: 0.2105133832, green: 0.3697865903, blue: 0.04452704638, alpha: 1)
        }
         */
        self.navigationController!.navigationBar.isTranslucent = false
        
        // Transparent Navigation Bar.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        
        /** Search presents a view controller by applying normal view controller presentation semantics.
         This means that the presentation moves up the view controller hierarchy until it finds the root
         view controller or one that defines a presentation context.
         */
        
        /** Specify that this view controller determines how the search controller is presented.
         The search controller should be presented modally and match the physical size of this view controller.
         */
        definesPresentationContext = true
    }
}

// MARK: - UISearchBarDelegate

extension InicioRootViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        updateSearchResults(for: searchController1)
    }
    
}


