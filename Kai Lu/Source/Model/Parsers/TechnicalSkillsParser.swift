//
//  ProjectParser.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 25/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import Foundation

class TechnicalSkill {
    private struct Keys {
        static var nameKey = "name"
        static var descriptionKey = "description"
        static var skillsKey = "skills"
    }
    
    var name: String
    var description: String
    var skills: [String] = []
    
    init(info: NSDictionary) {
        name = info.parse(Keys.nameKey)
        description = info.parse(Keys.descriptionKey)
        skills = info.parse(Keys.skillsKey)
    }
}

class TechnicalSkillParser {
    static var technicalSkills: [TechnicalSkill] = TechnicalSkillParser.loadTechnicalSkills()
    
    private class func loadTechnicalSkills() -> [TechnicalSkill] {
        var result: [TechnicalSkill] = []
        let arr = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("TechnicalSkills", ofType: "plist")!)!
        
        for dict in arr as! [NSDictionary] {
            let entity = TechnicalSkill(info: dict)
            result.append(entity)
        }
        
        return result
    }
}