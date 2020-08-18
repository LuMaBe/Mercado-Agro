//
//  RecentSearchesCell.swift
//  Mercado Agro
//
//  Created by Lucas Berger on 8/18/20.
//  Copyright © 2020 DreamTeam. All rights reserved.
//

import UIKit

class RecentSearchesCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    static let identifier = "RecentSearchesCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "RecentSearchesCell", bundle: nil)
    }
    
    @IBAction func clearCellButtonTapped(_ sender: UIButton) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /*let cell = RecentSearchesCell.CellStyle.self
        cell.backgroundColor = .clear
        cell.backgroundView = UIView()
        cell.selectedBackgroundView = UIView()*/
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
