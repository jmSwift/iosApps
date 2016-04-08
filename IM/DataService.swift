//
//  DataService.swift
//  IM
//
//  Created by Jose on 4/8/16.
//  Copyright © 2016 JoseApps. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    
   // DataService.init()
    
    static let ds = DataService()
    
    private var  NEW_REF_BASE = Firebase(url: "https://myinstantmessenger.firebaseio.com")
    
    
     var REF_BASE: Firebase {
        return NEW_REF_BASE
    }


}