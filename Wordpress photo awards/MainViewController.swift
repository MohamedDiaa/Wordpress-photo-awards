//
//  MainViewController.swift
//  Wordpress photo awards
//
//  Created by Mohammed Diaa on 26/08/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,UITextFieldDelegate {

    @IBOutlet var photosTableView:UITableView!
    var items:[Item]?{didSet{self.filtered = items}}
    var filtered:[Item]?

    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "PhotoTableViewCell", bundle: nil)
        self.photosTableView.registerNib(nib, forCellReuseIdentifier: "PhotoTableViewCell")
        // Do any additional setup after loading the view.
        self.photosTableView.estimatedRowHeight = 85.0
        self.photosTableView.rowHeight = UITableViewAutomaticDimension
        
        self.loadData { 
            //Do nothing
        }
        
        refreshControl.addTarget(self, action: #selector(MainViewController.beginRefreshing), forControlEvents: UIControlEvents.ValueChanged)
        self.photosTableView.addSubview(refreshControl)
    }

    func loadData(completion:()->())
    {
        Model.sharedInstance.loadData({ (items) in
            
                self.items = items
                self.photosTableView.reloadData()
                completion()
            
            }) { (error) in
                completion()
        }
    
    }
    
    func beginRefreshing()
    {
            self.loadData { 
                self.refreshControl.endRefreshing()
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
      
        if let items = self.filtered
        {
            return items.count
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell  = tableView.dequeueReusableCellWithIdentifier("PhotoTableViewCell") as? PhotoTableViewCell ,let items = self.filtered where items.count > indexPath.section
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let items = self.filtered where items.count > indexPath.section
        {
            let detailVC = DetailPhotoViewController(nibName: "DetailPhotoViewController", bundle: nil, item: items[indexPath.section])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    
    }
    
    //UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        
        if let items = self.items,let text = textField.text where !text.isEmpty
        {
            let filtered = items.filter({ (item) -> Bool in
                return item.matchText(text)
            })
            self.filtered = filtered
            self.photosTableView.reloadData()
        }
        else{
            self.loadData({ 
                
            })
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
