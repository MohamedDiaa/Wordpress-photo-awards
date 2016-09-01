//
//  ViewController.swift
//  Wordpress photo awards
//
//  Created by Mohammed Diaa on 26/08/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let mvc = MainViewController(nibName: "MainViewController", bundle: nil)
        
        mvc.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(mvc)
        let c1 = NSLayoutConstraint(item: self.view, attribute: .Top, relatedBy: .Equal, toItem: mvc.view, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let c2 = NSLayoutConstraint(item: self.view, attribute: .Bottom, relatedBy: .Equal, toItem: mvc.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let c3 = NSLayoutConstraint(item: self.view, attribute: .Leading, relatedBy: .Equal, toItem: mvc.view, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let c4 = NSLayoutConstraint(item: self.view, attribute: .Trailing, relatedBy: .Equal, toItem: mvc.view, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        
        self.view.addSubview(mvc.view)
        self.view.addConstraints([c1,c2,c3,c4])
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

