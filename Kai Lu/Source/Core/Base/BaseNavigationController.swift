//
//  BaseNavigationController.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 25/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("setup"), name: Constants.kAZNotificationColorChanged, object: nil)
        
        setup()
    }

    func setup() {
        let textAttributes = [NSForegroundColorAttributeName: UIColor.backgroundElementsColor,
            NSFontAttributeName: UIFont.appMediumFont()]
        self.navigationBar.titleTextAttributes = textAttributes
        
        self.navigationBar.setBackgroundImage(UIImage.imageFromColor(UIColor.backgroundColor), forBarMetrics: UIBarMetrics.Default)
        self.navigationBar.tintColor = appColor.contentColor
        
        self.navigationBar.translucent = false
    }

}
