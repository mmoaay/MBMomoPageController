//
//  MBTitleView.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/1.
//  Copyright © 2015年 MmoaaY. All rights reserved.
//

import UIKit

enum ContentType{
    case contentTypeLeft,contentTypeRight
}

//定义协议相应button方法
protocol MBTitleViewDelegate:NSObjectProtocol{
    //回调方法
    func slideWithType(_ type:ContentType)
}

class MBTitleView: UIView {
    
    
    static let shareInstance = MBTitleView()

    @IBOutlet var contentView: UIView!

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var indicator: UIView!

    
    @IBOutlet weak var leftIcon: UIView!
    @IBOutlet weak var rightIcon: UIView!
    
    var delegate:MBTitleViewDelegate?
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func getView() -> UIView! {
        Bundle.main.loadNibNamed("MBTitleView", owner: self, options: nil)
        
        self.leftButton.setTitleColor(UIColor(red: 255/255, green: 105/255, blue: 0, alpha: 1), for: UIControlState.disabled)
        self.leftButton.setTitleColor(UIColor(red: 239/255, green: 195/255, blue: 160/255, alpha: 1), for: UIControlState())
        
        self.rightButton.setTitleColor(UIColor(red: 255/255, green: 105/255, blue: 0, alpha: 1), for: UIControlState.disabled)
        self.rightButton.setTitleColor(UIColor(red: 239/255, green: 195/255, blue: 160/255, alpha: 1), for: UIControlState())
        
        self.leftButton.isEnabled=false
        self.rightButton.isEnabled=true
        
        return self.contentView
    }
    
    func setTitleXPos(_ xPos:CGFloat, width:CGFloat) {

        if xPos > width/2 {
            if self.leftButton.isEnabled == false {
                self.leftButton.isEnabled=true
                self.leftButton.titleLabel?.font=UIFont.systemFont(ofSize: 12)
                
                self.rightButton.isEnabled=false
                self.rightButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 15)
            }
        }
        else {
            if self.rightButton.isEnabled == false {
                self.rightButton.isEnabled=true
                self.rightButton.titleLabel?.font=UIFont.systemFont(ofSize: 12)
                
                self.leftButton.isEnabled=false
                self.leftButton.titleLabel?.font=UIFont.boldSystemFont(ofSize: 15)
            }
        }
        
        let leftButtonxPos = self.leftButton.center.x
        let rightButtonxPos = self.rightButton.center.x
        let topViewMoveUnit = (rightButtonxPos-leftButtonxPos)/width
        
        self.topView.transform=CGAffineTransform(translationX: -xPos*topViewMoveUnit, y: 0)
        
        
        let leftIconxPos = self.leftIcon.frame.origin.x
        let rightIconxPos = self.rightIcon.frame.origin.x
        let indicatorMoveUnit = (rightIconxPos-leftIconxPos)/width
        let scalex = sin(CGFloat(M_PI) * (xPos/width))*2
        
        self.indicator.frame = CGRect(x: self.leftIcon.frame.origin.x+indicatorMoveUnit*xPos-scalex*self.leftIcon.frame.size.width/2, y: self.indicator.frame.origin.y, width: self.leftIcon.frame.size.width*(scalex+1), height: self.indicator.frame.size.height)
//        let translationTransfrom = CGAffineTransformMakeTranslation(xPos*indicatorMoveUnit, 0)
//        self.indicator.transform=CGAffineTransformScale(translationTransfrom, scalex, 1)
    }

    @IBAction func leftPressed(_ sender: AnyObject) {
        delegate?.slideWithType(ContentType.contentTypeLeft)
    }
    
    @IBAction func rightPressed(_ sender: AnyObject) {
        delegate?.slideWithType(ContentType.contentTypeRight)
    }
}
