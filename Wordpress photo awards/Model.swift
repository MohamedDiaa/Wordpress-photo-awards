//
//  Model.swift
//  Wordpress photo awards
//
//  Created by Mohammed Diaa on 26/08/16.
//  Copyright © 2016 Mohammed Diaa. All rights reserved.
//

import UIKit
import Alamofire

class Model: NSObject {

    
    func loadData(completion:(items:[Item]?)->Void , failure: (error:Error)-> Void)
    {
        let link = "https://static.mobileinteraction.se/developertest/wordpressphotoawards.json"
        
        Alamofire.request(.GET, link).responseJSON { (response) in
            
            switch(response.result)
            {
            case .Success(let json):
                    return completion(items: self.parseJson(json))
                
            case .Failure(let error):
                return failure(error: Error(systemError: error, appError: nil))

            }
            
        }
    }

    func parseJson(let json:AnyObject) -> [Item]?
    {
    if let files = json as? [[String:AnyObject]]
    {
        var items = [Item]()
        for file in files
        {
            let name = file["name"] as? String ?? "photo"
            let descripton = file["description"] as? String ?? "description"
            let urlString = file["url"] as? String ?? ""
            let url = NSURL(string: urlString)
            
            var tags:[Tag]?
            if let tagArray = file["tags"] as? [String]
            {
                var tagItems = [Tag]()
                for tag in tagArray
                {
                    tagItems.append(Tag(name: tag))
                }
                tags = tagItems
            }
            
            let item = Item(name: name, description: descripton, url: url, tags: tags)
            items.append(item)
        }
        return items
    }
    return nil
}


}