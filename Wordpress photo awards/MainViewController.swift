//
//  MainViewController.swift
//  Wordpress photo awards
//
//  Created by Mohammed Diaa on 26/08/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var photosTableView:UITableView!
    var items:[Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "PhotoTableViewCell", bundle: nil)
        self.photosTableView.registerNib(nib, forCellReuseIdentifier: "PhotoTableViewCell")
        // Do any additional setup after loading the view.
        self.photosTableView.estimatedRowHeight = 85.0
        self.photosTableView.rowHeight = UITableViewAutomaticDimension
        
        self.loadData()
    }

    func loadData()
    {
        Model.sharedInstance.loadData({ (items) in
            
                self.items = items
                self.photosTableView.reloadData()
            
            }) { (error) in
                
        }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     //UITableViewDelegate,UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      
        if let items = self.items
        {
            return items.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell  = tableView.dequeueReusableCellWithIdentifier("PhotoTableViewCell") as? PhotoTableViewCell ,let items = self.items where items.count > indexPath.section
        {
            cell.set(items[indexPath.section],refreshCell: {
            
                if tableView.numberOfSections > indexPath.section
                {
                        tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: UITableViewRowAnimation.None)
                }
            })
        
            return cell
        }
        
         return UITableViewCell()
    }
   
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let vw = NSBundle.mainBundle().loadNibNamed("PhotoTableViewHeader", owner: nil, options: nil)[0] as? UIView{
        
            return vw
        }
        return nil
    }
 
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
