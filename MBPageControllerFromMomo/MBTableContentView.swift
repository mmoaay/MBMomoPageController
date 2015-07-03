//
//  MBTableContentView.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/3.
//  Copyright © 2015年 MmoaaY. All rights reserved.
//

import UIKit

class MBTableContentView: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var contentView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NSBundle.mainBundle().loadNibNamed("MBTableContentView", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.initConstraint()
        
        self.initTableView()
    }
    
    func initTableView(){
        let tableHeaderView = MBTableHeaderView.shareInstance().getView()
        tableHeaderView.frame = CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.width)
        self.tableView.tableHeaderView = tableHeaderView
        
        self.parallelHeaderView = headImageView
    }
    
    func initConstraint(){
        let views:[String:UIView] = ["contentView":self.contentView]
        let layoutStringH:String = "|-0-[contentView]-0-|"
        let layoutStringV:String = "V:|-0-[contentView]-0-|"
        let contraintsH:[NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat(layoutStringH, options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: views)
        let contraintsV:[NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat(layoutStringV, options:NSLayoutFormatOptions(rawValue:0), metrics:nil, views: views)
        self.addConstraints(contraintsH)
        self.addConstraints(contraintsV)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 10
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(format: "Section %d", section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "cellIdentifier"
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = String(format: "Cell %d", indexPath.row)
        cell?.detailTextLabel?.text = "Watch out!!! Something AWESOME is coming~~~"
        return cell!
    }

}
