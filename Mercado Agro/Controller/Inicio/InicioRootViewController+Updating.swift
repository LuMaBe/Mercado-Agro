//
//  InicioRootViewController+Updating.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/13/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

extension InicioRootViewController: UISearchResultsUpdating {
    
    private func findMatches(searchString: String) {
        filteredProducts = []
        
        if searchString == "" {
            filteredProducts = productos.lista
            
        } else {
            
            for productos in productos.lista {
                if productos.titulo.lowercased().contains(searchString.lowercased()) {
                    filteredProducts.append(productos)
                }
            }
        }
        
        DispatchQueue.main.async {
            
            self.tableView.reloadData()
            
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        searchController.searchResultsController?.view.isHidden = false
        let searchBar = searchController.searchBar
        findMatches(searchString: searchBar.text!)
    }
    
}
