//
//  ClearCellAction.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/27/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: USED IN... extension ResultsScreen: ClearCellAction (to clear selected history cells).

import UIKit

protocol ClearCellAction: class {
    func clearCell(tag: Int)
}
