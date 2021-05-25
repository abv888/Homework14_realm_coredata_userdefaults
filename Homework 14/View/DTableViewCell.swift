//
//  DTableViewCell.swift
//  Homework 14
//
//  Created by  Bagrat Arutyunov on 02.02.2021.
//

import UIKit

class DTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var mainStack: UIStackView!
    
    @IBOutlet weak var dateStack: UIStackView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
