//
//  MBAddViewController.swift
//  MBPageControllerFromMomo
//
//  Created by Perry on 15/7/3.
//  Copyright © 2015年 MmoaaY. All rights reserved.
//

import UIKit

class MBAddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.navigationController?.viewControllers[0] == self {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: Selector("donePressed:"))
        }
    }

    func donePressed(sender: AnyObject) {
        self .dismissViewControllerAnimated(true, completion: nil)
    }
}
