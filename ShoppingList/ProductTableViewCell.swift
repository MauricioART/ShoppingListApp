//
//  TableViewCell.swift
//  ShoppingList
//
//  Created by Diplomado on 30/11/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addButton.title(for: .normal)
        addButton.titleLabel?.text = "Add"
//        addButton.setImage(UIImage(systemName: "plus.circle.fill"))
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
