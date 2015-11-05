//
//  InterestsParser.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 26/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import Foundation

class Interest {
    private struct Keys {
        static var nameKey = "name"
        static var imageNameKey = "image_name"
        static var descriptionKey = "description"
    }
    
    var name: String
    var imageName: String
    var description: String
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        imageName = info.parse(Keys.imageNameKey)
        description = info.parse(Keys.descriptionKey)
    }
}

class InterestsParser {
    static var interests: [Interest] = InterestsParser.loadInterests()
    
    private class func loadInterests() -> [Interest] {
        var result: [Interest] = []
        let arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Interests", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            let entity = Interest(info: dict)
            result.append(entity)
        }
        
        return result
    }
}