//
//  ScreenshotCollectionViewCell.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 26/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import UIKit

class ScreenshotCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var screenshotImageView: UIImageView! {
        didSet {
            screenshotImageView.layer.borderColor = UIColor.contentElementsColor.CGColor
            screenshotImageView.layer.cornerRadius = Apperance.defaultCornerRadius
            screenshotImageView.layer.masksToBounds = true
        }
    }
    
    var needToShowFrame: Bool = false {
        didSet {
            if needToShowFrame {
                screenshotImageView.layer.borderWidth = 1
                
            } else {
                screenshotImageView.layer.borderWidth = 0
            }
        }
    }
    
}
