//
//  ResultsScreen+ClearCellAction.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/27/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: ClearCellAction protocol defined.

import UIKit

extension ResultsScreen: ClearCellAction {
    // Clears selected cell and information stored in UserDefaults.
    func clearCell(tag: Int) {
        History.recentSearches.remove(at: tag)
        HistoryUserDefaults.defaults.removeObject(forKey: UserDefaultKeys.historyUserDefaults)
        HistoryUserDefaults.defaults.set(History.recentSearches, forKey: UserDefaultKeys.historyUserDefaults)
        
        tableView.reloadData()
    }
}
