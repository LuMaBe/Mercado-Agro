//
//  InicioRootViewController.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/9/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class InicioRootViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {
    
    // Variable Declarations.
    private var resultsTableController: ResultsTableController!
    var searchController = UISearchController()
    var productos = ListaProductos()
    var filteredProducts = [Productos]()
    var searching: Bool!
    var history: [String]! = []
    let defaults = UserDefaults.standard
    let tableViewCellIdentifier = "cellID"
    let historyViewCellIdentifier = "historyCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View background.
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
        
        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: tableViewCellIdentifier)
        
        resultsTableController =
            self.storyboard?.instantiateViewController(withIdentifier: "ResultsTableController") as? ResultsTableController
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = (resultsTableController!)
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        
        // This view controller is interested in table view row selections.
        self.tableView.delegate = self
        
        customizedSearchBar()
        transparentNavigationBar()
        /** Search presents a view controller by applying normal view controller presentation semantics.
         This means that the presentation moves up the view controller hierarchy until it finds the root
         view controller or one that defines a presentation context.
         */
        
        /** Specify that this view controller determines how the search controller is presented.
         The search controller should be presented modally and match the physical size of this view controller.
         */
        definesPresentationContext = true
    }
    
    /* POR SI MÁS ADELANTE PINTA ALGÚN OTRO CAMBIO EN EL DISEÑO DE LA SEARCH BAR...
     
     Custom Search Icon:
     searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.search, state: .normal)
     
     Custom Clear Icon:
     searchController.searchBar.setImage(UIImage(named: "my_search_icon"), for: UISearchBarIcon.clear, state: .normal)
     
     */
    
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
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0 // CHANGE.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")! as UITableViewCell
        
        // Dejo transparente el fondo de las celdas.
        cell.backgroundColor = .clear
        cell.backgroundView = UIView()
        cell.selectedBackgroundView = UIView()
        
        return cell
    }
    
    
}
