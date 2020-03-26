//
//  CountryService.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation


class CountryService {
    
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(completion: (([Country]) -> Void)?) {
        self.service?.get(url: Constants.countries, response: [Country].self, completion: { (stats, countries) in
            completion?(countries ?? [])
        })
    }
}
