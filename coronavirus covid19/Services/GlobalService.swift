//
//  GlobalService.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

class GlobalService {
    
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(completion: ((Global?) -> Void)?) {
        self.service?.get(url: Constants.global, response: Global.self, completion: { (stats, global) in
            completion?(global)
        })
    }
}
