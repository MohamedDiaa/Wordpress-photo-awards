//
//  PhotoTableViewCell.swift
//  Wordpress photo awards
//
//  Created by MohamedDiaa on 9/1/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit

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
    
    func set(item:Item){
    
        self.blogLabel.text = item.name
        
    }
}
