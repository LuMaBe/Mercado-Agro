//
//  HistoryTableViewCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/21/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let nibName = "HistoryTableViewCell"
    static let cellIdentifier = "historyCellId"
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var clockImage: UIImageView!
    @IBOutlet weak var clearButton: UIButton!
    let color = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        clockImage.tintColor = color
        clearButton.tintColor = color
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        print("ClearButtonPressed! -> Code Pending...")
    }
}
