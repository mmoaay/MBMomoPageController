//
//  MBTableContentView.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/3.
//  Copyright © 2015年 MmoaaY. All rights reserved.
//

import UIKit

//定义协议相应button方法
protocol MBTableContentViewDelegate:NSObjectProtocol{
    //回调方法
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
}

class MBTableContentView: UIView, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var headImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var contentView: UIView!
    
    var delegate:MBTableContentViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("MBTableContentView", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.initConstraint()
        
        self.initTableView()
    }
    
    func initTableView(){
        let tableHeaderView = MBTableHeaderView.shareInstance.getView()
        tableHeaderView?.frame = CGRect(x: 0, y: 0, width: SCREEN_SIZE.width, height: SCREEN_SIZE.width)
        self.tableView.tableHeaderView = tableHeaderView
        
        self.parallelHeaderView = headImageView
    }
    
    func initConstraint(){
        let views:[String:UIView] = ["contentView":self.contentView]
        let layoutStringH:String = "|-0-[contentView]-0-|"
        let layoutStringV:String = "V:|-0-[contentView]-0-|"
        let contraintsH:[NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: layoutStringH, options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: views)
        let contraintsV:[NSLayoutConstraint] = NSLayoutConstraint.constraints(withVisualFormat: layoutStringV, options:NSLayoutFormatOptions(rawValue:0), metrics:nil, views: views)
        self.addConstraints(contraintsH)
        self.addConstraints(contraintsV)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 10
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(format: "Section %d", section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectRowAtIndexPath(indexPath)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier : String = "cellIdentifier"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        }
        cell?.textLabel?.text = String(format: "Cell %d", indexPath.row)
        cell?.detailTextLabel?.text = "Watch out!!! Something AWESOME is coming~~~"
        return cell!
    }

}
