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
        
        let navController = UINavigationController(rootViewController: mvc)

        navController.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(navController)
        
        self.view.addSubview(navController.view)
        self.view.addConstraints(self.view.createAlignConstraints(navController.view))
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIView
{
    func createAlignConstraints(withView:UIView) -> [NSLayoutConstraint]
    {
        
        let c1 = NSLayoutConstraint(item: self, attribute: .Top, relatedBy: .Equal, toItem: withView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let c2 = NSLayoutConstraint(item: self, attribute: .Bottom, relatedBy: .Equal, toItem: withView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        let c3 = NSLayoutConstraint(item: self, attribute: .Leading, relatedBy: .Equal, toItem: withView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let c4 = NSLayoutConstraint(item: self, attribute: .Trailing, relatedBy: .Equal, toItem: withView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        
        return [c1,c2,c3,c4]
    }

}