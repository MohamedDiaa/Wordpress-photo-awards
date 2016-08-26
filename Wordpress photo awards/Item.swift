//
//  Item.swift
//  Wordpress photo awards
//
//  Created by Mohammed Diaa on 26/08/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import Foundation

struct Item {
    
    let name:String
    let description:String
    let url:NSURL?
    let tags : [Tag]?
}


struct Tag{

    let name:String
}


struct Error{

    let error: NSError?
    
    var description:String?{
        
        get{
            if let error = self.error
            {
                return error.description
            }
            return "Unknow Error"
        }
    }
    
    
}