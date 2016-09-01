//
//  DetailPhotoViewController.swift
//  Wordpress photo awards
//
//  Created by MohamedDiaa on 9/1/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit
import TagListView

class DetailPhotoViewController: UIViewController {

    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var imgView:UIImageView!
    @IBOutlet var descriptionTextView: UITextView!
    @IBOutlet var tagList:TagListView!
    
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
    
        if let tags = item.tags
        {
            tags.forEach({ (tag) in
                self.tagList.addTag(tag.name)
            })
        }
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
        if let delgate = UIApplication.sharedApplication().delegate as? AppDelegate , window = delgate.window
        {
            let imgView = UIImageView()
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.backgroundColor = UIColor.groupTableViewBackgroundColor()
            imgView.contentMode = UIViewContentMode.ScaleAspectFit
            imgView.loadItem(item, completed: { 
                
            })
            let c = window.createAlignConstraints(imgView)
            window.addSubview(imgView)
            window.addConstraints(c)
            imgView.userInteractionEnabled = true
            
            let gesture = UITapGestureRecognizer(target: imgView, action: #selector(UIImageView.removeFromSuperview))
            imgView.addGestureRecognizer(gesture)
        }
        print("image Selected")
    }
}
