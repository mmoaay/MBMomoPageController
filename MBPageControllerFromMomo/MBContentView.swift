//
//  MBContentView.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/1.
//  Copyright (c) 2015年 MmoaaY. All rights reserved.
//

import UIKit

class MBContentView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Bundle.main.loadNibNamed("MBContentView", owner: self, options: nil)
        self.addSubview(self.contentView)
        
        self.initConstraint()
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
    
    func setTitle(_ title:String){
        self.titleLabel.text=title
    }

}
