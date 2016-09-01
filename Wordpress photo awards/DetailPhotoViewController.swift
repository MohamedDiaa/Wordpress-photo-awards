//
//  DetailPhotoViewController.swift
//  Wordpress photo awards
//
//  Created by MohamedDiaa on 9/1/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit

class DetailPhotoViewController: UIViewController {

    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    
    var item:Item!
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?,item:Item)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.item = item
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
        self.titleLabel.text = item.name
        self.imgView.loadItem(item) { 
            //Nothing here yet
        }
        self.descriptionTextView.text = item.description
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.descriptionTextView.scrollEnabled = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func imageSelected()
    {
        print("image Selected")
    }
}
