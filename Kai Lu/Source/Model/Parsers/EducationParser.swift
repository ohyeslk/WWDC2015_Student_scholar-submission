//
//  EducationParser.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 26/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import Foundation

class EducationParser {
    private struct Keys {
        static var infoNameKey = "name"
        static var infoDescriptionKey = "description"
    }
    
    static var education: [[InfoItem]] = EducationParser.loadEducationInfo()
    
    private class func loadEducationInfo() -> [[InfoItem]] {
        var result: [[InfoItem]] = []
        let arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Education", ofType: "plist")!)!
        
        for educationCategoryArray in arr as! [NSArray] {
            var localResult: [InfoItem] = []
            
            for additionalInfoItem in educationCategoryArray as! [NSDictionary] {
                let projectInfo = InfoItem(name: additionalInfoItem.parse(Keys.infoNameKey), description: additionalInfoItem.parse(Keys.infoDescriptionKey))
                localResult.append(projectInfo)
            }
            
            result.append(localResult)
        }
        
        return result
    }
}