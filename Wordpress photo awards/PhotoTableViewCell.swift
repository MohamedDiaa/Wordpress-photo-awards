//
//  PhotoTableViewCell.swift
//  Wordpress photo awards
//
//  Created by MohamedDiaa on 9/1/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var blogLabel: UILabel!
    
    @IBOutlet var postImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(item:Item, refreshCell:()->()){
    
        self.blogLabel.text = item.name
        self.postImageView.loadItem(item, completed: refreshCell)
    }
}


extension UIImageView{
    
    func loadItem(item:Item,completed:()->()){
    
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let imageCache = delegate.imageCache

        if let cachedImg = imageCache.imageWithIdentifier("\(item.name.hash)")
        {
            //print("Cached= \(item.name.hash)")
            self.image = cachedImg
        }
        else if let url = item.url
        {
            self.af_setImageWithURL(url, placeholderImage: UIImage(named:"LoadingImage"), completion: { (response) in
                
                switch(response.result)
                {
                case .Success(let img):
                    imageCache.addImage(img, withIdentifier: "\(item.name.hash)")
                    completed()
                case .Failure(_):
                    break
                }
            })
        }
    }
}