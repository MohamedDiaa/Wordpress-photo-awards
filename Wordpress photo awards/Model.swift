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

    
    func loadData(completion:(items:[Item])->Void , failure: (error:Error)-> Void)
    {
        let link = "https://static.mobileinteraction.se/developertest/wordpressphotoawards.json"
        
        Alamofire.request(.GET, link).responseJSON { (response) in
            
            switch(response.result)
            {
            case .Success(let json):
                    break
            case .Failure(let error):
                    break
            }
            
        }
    }
}
