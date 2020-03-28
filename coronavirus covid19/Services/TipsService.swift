//
//  TipsService.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 27/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

/*
 
 {
     "where": {},
     "limit": 2000,
     "order": "-updatedAt",
     "_method": "GET",
     "_ApplicationId": "123242d9f6164a2d1b6eb0266010f1b1",
     "_ClientVersion": "js1.11.1",
     "_InstallationId": "b493558c-4e62-16e6-103c-493c4555f728"
 }
 */

class TipsService {
    
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(completion: (([Tip]?) -> Void)?) {
        let tips: TipEncodedPost = TipEncodedPost(limit: 2000, order: "-updatedAt", _method: "GET", _ApplicationId: "123242d9f6164a2d1b6eb0266010f1b1", _ClientVersion: "js1.11.1", _InstallationId: "b493558c-4e62-16e6-103c-493c4555f728")
        self.service?.post(url: Constants.dicas, params: tips, response: [Tip].self, completion: { (status, results) in
            completion?(results)
        })
    }
}
