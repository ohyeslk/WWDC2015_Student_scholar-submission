//
//  TechnicalSkillsViewController.swift
//  Kai Lu (Luke)
//
//  Created by Kai Lu on 26/05/15.
//  Copyright (c) 2015 Kai Lu. All rights reserved.
//

import UIKit

class TechnicalSkillsViewController: BaseViewController {

    @IBOutlet var tableView: UITableView!
    
    var technicalSkills = TechnicalSkillParser.technicalSkills
    var oppenedCategories: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: Apperance.defaultSpace, right: 0)
        
        tableView.registerNib(UINib(nibName: Constants.infoTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.infoTableViewCellIdentifier)
        tableView.registerNib(UINib(nibName: Constants.plainTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.plainTableViewCellIdentifier)
        tableView.registerNib(UINib(nibName: "SpaceTableViewCell", bundle: nil), forCellReuseIdentifier: "SpaceTableViewCell")
    }
    
    func numberOfElementsInSection(section: Int) -> Int {
        return numberOfElementsInSection(section, mechOppened: false)
    }
    
    func numberOfElementsInSection(section: Int, mechOppened: Bool) -> Int {
        if oppenedCategories.indexOf(section) != nil || mechOppened  {
            return technicalSkills[section].skills.count + 2
        }
        return 1
    }
}

// MARK: - UITableViewDataSource

extension TechnicalSkillsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return technicalSkills.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfElementsInSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: RoundedTableViewCell
        
        switch indexPath.row {
        case 0:
            cell = titleCell(tableView, cellForRowAtIndexPath: indexPath)
        case 1:
            cell = acquiredCell(tableView, cellForRowAtIndexPath: indexPath)
        default:
            cell = skillCell(tableView, cellForRowAtIndexPath: indexPath)
        }
        
        let numberOfElements = numberOfElementsInSection(indexPath.section)
        
        if numberOfElements == 1 {
            cell.roundedType = .AllRounded
        } else if indexPath.row == 0 {
            cell.roundedType = .TopRounded
        } else if indexPath.row == numberOfElements - 1 {
            cell.roundedType = .BottomRounded
        } else {
            cell.roundedType = .None
        }
        
        return cell
    }
}

// MARK: - Cells

extension TechnicalSkillsViewController {
    func titleCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.plainTableViewCellIdentifier, forIndexPath: indexPath) as! PlainTableViewCell
        
        cell.nameLabel.text = technicalSkills[indexPath.section].name
        cell.selectionEnable = true
        
        return cell
    }
    
    func acquiredCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.infoTableViewCellIdentifier, forIndexPath: indexPath) as! InfoTableViewCell
        
        cell.selectionEnable = false
        cell.nameLabel.text = "Info"
        cell.infoDescription = technicalSkills[indexPath.section].description
        
        return cell
    }
    
    func skillCell(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> RoundedTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.plainTableViewCellIdentifier, forIndexPath: indexPath) as! PlainTableViewCell
        
        cell.nameLabel.text = technicalSkills[indexPath.section].skills[indexPath.row - 2]
        cell.nameLabel.textColor = UIColor.contentAdditionalElementsColor
        cell.selectionEnable = false
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension TechnicalSkillsViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! PlainTableViewCell
        
        tableView.beginUpdates()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var indexPathes: [NSIndexPath] = []
        for i in 1..<numberOfElementsInSection(indexPath.section, mechOppened: true) {
            indexPathes.append(NSIndexPath(forRow: i, inSection: indexPath.section))
        }
        
        if let index = oppenedCategories.indexOf(indexPath.section) {
            oppenedCategories.removeAtIndex(index)
            tableView.deleteRowsAtIndexPaths(indexPathes, withRowAnimation: UITableViewRowAnimation.Fade)
            
            cell.setOpened(false, animated: true, complition: { () -> () in
                cell.roundedType = .AllRounded
            })
            
        } else {
            oppenedCategories.append(indexPath.section)
            tableView.insertRowsAtIndexPaths(indexPathes, withRowAnimation: UITableViewRowAnimation.Fade)
            
            cell.roundedType = .TopRounded
            cell.setOpened(true, animated: true)
        }
        
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView().fill() { $0.backgroundColor = UIColor.clearColor() }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Apperance.defaultSpace
    }
}