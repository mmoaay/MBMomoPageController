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
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(MBAddViewController.donePressed(_:)))
        }
    }

    func donePressed(_ sender: AnyObject) {
        self .dismiss(animated: true, completion: nil)
    }
}
