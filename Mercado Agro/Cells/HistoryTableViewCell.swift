//
//  HistoryTableViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//
// MARK: History cell's & method to clear selected cell.

import UIKit

class HistoryTableViewCell: UITableViewCell {
    // Variable declaration:
    weak var selectionDelegate: ClearCellAction?
    static let nibName = "HistoryTableViewCell"
    static let cellIdentifier = "historyCellId"
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var clockImage: UIImageView!
    @IBOutlet weak var clearButton: UIButton!
    
    // Cell items (clockImage, clearButton) prepared.
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setClockImage()
        setlbTitle()
        setClearButton()
        setViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // When the button is pressed it goes to the defined protocol in 'Extensions' -> 'ResultsScreen+ClearCellAction'.
    // It clears the desired cell.
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        selectionDelegate?.clearCell(tag: sender.tag)
    }
    
    func setViews() {
        leftView.backgroundColor = .clear
        rightView.backgroundColor = .clear
    }
    
    func setClockImage() {
        clockImage.tintColor = .black
        clockImage.backgroundColor = .clear
    }
    
    func setlbTitle() {
        lbTitle.backgroundColor = .clear
        lbTitle.numberOfLines = 1
        lbTitle.adjustsFontSizeToFitWidth = false
    }
    
    func setClearButton() {
        clearButton.tintColor = .black
        clearButton.backgroundColor = .clear
    }
}
