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
    
    
    func matchText(text:String)->Bool
    {
        //Match Name , tags then no matching
        if name.localizedCaseInsensitiveContainsString(text){
            return true
        }
        else if let tags = self.tags
        {
            for tag in tags
            {
                if tag.name.localizedCaseInsensitiveContainsString(text)
                {
                    return true
                }
            }
        }
        return false
    }
}


struct Tag{

    let name:String
}


struct Error{

    let systemError: NSError?
    let appError:String?
    
    var description:String?{
        
        get{
            if let error = self.systemError
            {
                return error.description
            }
            else if let appError = self.appError
            {
                return appError
            }
            return "Unknow Error"
        }
    }
    
    
}