//
//  MenuItemCollectionViewCell.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 26/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import UIKit

class MenuItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    var fillColor: UIColor = UIColor.lightGrayColor()
    
    @IBOutlet weak var categoryNameLabel: UILabel! {
        didSet {
            categoryNameLabel.font = UIFont.appDemiBoldFont()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = Apperance.defaultCornerRadius
        self.contentView.layer.borderWidth = 1.0
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView!.layer.cornerRadius = Apperance.defaultCornerRadius
        self.selectedBackgroundView!.layer.masksToBounds = true
    }
    
    func fillWithColor(color: UIColor) {
        fillColor = color
        categoryNameLabel.textColor = color
        iconImage.image = iconImage.image?.imageWithColor(color)
        
        self.contentView.layer.borderColor = color.CGColor
        self.selectedBackgroundView!.backgroundColor = color.colorWithAlphaComponent(0.6)
    }
}
