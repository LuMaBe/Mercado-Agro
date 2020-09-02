//
//  HomeScreen.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: HomeScreen setup.

import UIKit

class HomeScreen: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    // Variable Declarations.
    private var resultsScreen: ResultsScreen!
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        customSearchBarStyle()
        transparentNavigationBar()
        
        definesPresentationContext = true
    }
    
    private func setup() {
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Identifiers.tableCell)
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        self.tableView.delegate = self
        
        resultsScreen =
            self.storyboard?.instantiateViewController(withIdentifier: Identifiers.resultsScreen) as? ResultsScreen
        searchController = UISearchController(searchResultsController: resultsScreen) //Already in Init (MASearchC)
        searchController.searchResultsUpdater = (resultsScreen!)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
    }
    
    // Makes the SearchBar customized with my settings.
    private func customSearchBarStyle() {
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
    private func transparentNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(imageLiteralResourceName: "navigationBackground"), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0 // CHANGE.
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}

/* POR SI MÁS ADELANTE PINTA ALGÚN OTRO CAMBIO EN EL DISEÑO DE LA SEARCH BAR...

Custom Search Icon:
searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)

Custom Clear Icon:
searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)

*/
