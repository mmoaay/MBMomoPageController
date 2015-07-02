//
//  MBTitleView.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/1.
//  Copyright © 2015年 MmoaaY. All rights reserved.
//

import UIKit

enum ContentType{
    case ContentTypeLeft,ContentTypeRight
}

//定义协议相应button方法
protocol MBTitleViewDelegate:NSObjectProtocol{
    //回调方法
    func slideWithType(type:ContentType)
}

class MBTitleView: UIView {
    
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
    
    class func shareInstance()->MBTitleView{
        struct MBSingleton{
            static var predicate:dispatch_once_t = 0
            static var instance:MBTitleView? = nil
        }
        dispatch_once(&MBSingleton.predicate,{
            MBSingleton.instance=MBTitleView()
            }
        )
        return MBSingleton.instance!
    }
    
    func getView() -> UIView! {
        NSBundle.mainBundle().loadNibNamed("MBTitleView", owner: self, options: nil)
        
        self.leftButton.setTitleColor(UIColor(red: 255/255, green: 105/255, blue: 0, alpha: 1), forState: UIControlState.Disabled)
        self.leftButton.setTitleColor(UIColor(red: 239/255, green: 195/255, blue: 160/255, alpha: 1), forState: UIControlState.Normal)
        
        self.rightButton.setTitleColor(UIColor(red: 255/255, green: 105/255, blue: 0, alpha: 1), forState: UIControlState.Disabled)
        self.rightButton.setTitleColor(UIColor(red: 239/255, green: 195/255, blue: 160/255, alpha: 1), forState: UIControlState.Normal)
        
        self.leftButton.enabled=false
        self.rightButton.enabled=true
        
        return self.contentView
    }
    
    func setTitleXPos(xPos:CGFloat, width:CGFloat) {

        if xPos > width/2 {
            if self.leftButton.enabled == false {
                self.leftButton.enabled=true
                self.leftButton.titleLabel?.font=UIFont.systemFontOfSize(12)
                
                self.rightButton.enabled=false
                self.rightButton.titleLabel?.font=UIFont.boldSystemFontOfSize(15)
            }
        }
        else {
            if self.rightButton.enabled == false {
                self.rightButton.enabled=true
                self.rightButton.titleLabel?.font=UIFont.systemFontOfSize(12)
                
                self.leftButton.enabled=false
                self.leftButton.titleLabel?.font=UIFont.boldSystemFontOfSize(15)
            }
        }
        
        let leftButtonxPos = self.leftButton.center.x
        let rightButtonxPos = self.rightButton.center.x
        let topViewMoveUnit = (rightButtonxPos-leftButtonxPos)/width
        
        self.topView.transform=CGAffineTransformMakeTranslation(-xPos*topViewMoveUnit, 0)
        
        
        let leftIconxPos = self.leftIcon.frame.origin.x
        let rightIconxPos = self.rightIcon.frame.origin.x
        let indicatorMoveUnit = (rightIconxPos-leftIconxPos)/width
        let scalex = sin(CGFloat(M_PI) * (xPos/width))*2
        
        self.indicator.frame = CGRectMake(self.leftIcon.frame.origin.x+indicatorMoveUnit*xPos-scalex*self.leftIcon.frame.size.width/2, self.indicator.frame.origin.y, self.leftIcon.frame.size.width*(scalex+1), self.indicator.frame.size.height)
//        let translationTransfrom = CGAffineTransformMakeTranslation(xPos*indicatorMoveUnit, 0)
//        self.indicator.transform=CGAffineTransformScale(translationTransfrom, scalex, 1)
    }

    @IBAction func leftPressed(sender: AnyObject) {
        delegate?.slideWithType(ContentType.ContentTypeLeft)
    }
    
    @IBAction func rightPressed(sender: AnyObject) {
        delegate?.slideWithType(ContentType.ContentTypeRight)
    }
}
