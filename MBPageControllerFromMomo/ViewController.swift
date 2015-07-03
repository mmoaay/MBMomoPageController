//
//  ViewController.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/1.
//  Copyright (c) 2015年 MmoaaY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, MBTitleViewDelegate, MBTableContentViewDelegate{

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var firstView: MBTableContentView!
    @IBOutlet weak var secondView: MBContentView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.initContent()
        self.initNavTitle()
    }
    
    func initContent() -> Bool{
        self.firstView.delegate = self
        self.secondView.setTitle("CHECK")
        
        return true
    }
    
    func initNavTitle(){
        let titleView = MBTitleView.shareInstance().getView()
        titleView.frame = CGRectMake(44, 0, SCREEN_SIZE.width-88, 44)
        self.navigationItem.titleView = titleView
        MBTitleView.shareInstance().delegate = self
//        self.initTitleViewConstraint(self.navigationItem.titleView)
    }
    
//    private func initTitleViewConstraint(titleView:UIView!){
//        titleView.translatesAutoresizingMaskIntoConstraints = false
//        
//        let views:[String:UIView] = ["titleView":titleView]
//        let layoutStringH:String = "|-60-[titleView]-60-|"
//        let layoutStringV:String = "V:|-0-[titleView]-0-|"
//        let contraintsH:[NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat(layoutStringH, options:NSLayoutFormatOptions(rawValue: 0), metrics:nil, views: views)
//        let contraintsV:[NSLayoutConstraint] = NSLayoutConstraint.constraintsWithVisualFormat(layoutStringV, options:NSLayoutFormatOptions(rawValue:0), metrics:nil, views: views)
//        titleView.superview?.addConstraints(contraintsH)
//        titleView.superview?.addConstraints(contraintsV)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        MBTitleView.shareInstance().setTitleXPos(scrollView.contentOffset.x, width: scrollView.bounds.size.width)
    }
    
    func slideWithType(type:ContentType) {
        if ContentType.ContentTypeLeft == type{
            self.scrollView.scrollRectToVisible(CGRectOffset(self.scrollView.frame, 0, 0), animated: true)
        }else{
            self.scrollView.scrollRectToVisible(CGRectOffset(self.scrollView.frame, scrollView.bounds.size.width, 0), animated: true)
        }
    }
    
    func didSelectRowAtIndexPath(indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("pushFromHomeToAdd", sender: nil)
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("modelFromHomeToAdd", sender: nil)
    }
}

