//
//  HistoricalService.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 27/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import UIKit

class HistoricalService {
    
    var service: NetworkProtocolType?
    
    init(service: NetworkProtocolType?) {
        self.service = service
    }
    
    func getAll(completion: (([Historical]?) -> Void)?) {
        self.service?.get(url: Constants.historical, response: [Historical].self, completion: { (stats, global) in
            completion?(global)
        })
    }
    
    func getSpecificCountry(country: Country, historical: [Historical]?) -> Historical? {
        let countryName = country.country?.lowercased()
        return historical?.first(where: { $0.country == countryName })
    }
    
    func getCasesDeathsUntilYesterday(historical: [Historical]) -> (cases: Int64, deaths: Int64) {
        var todayCases: Int64 = 0
        var todayDeaths: Int64 = 0
        let today = self.getToday()
        _ = historical.map {
            todayCases += $0.timeline?.cases?.first(where: {$0.key == today})?.value ?? 0
            todayDeaths += $0.timeline?.deaths?.first(where: {$0.key == today})?.value ?? 0
        }
        return (cases: todayCases, deaths: todayDeaths)
    }
    
    private func getToday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let today = formatter.string(from: yesterday ?? Date())
        return today
    }
    
}
