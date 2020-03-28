//
//  PaisViewModel.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import Charts

enum HistoricalType: Int {
    case cases, deaths
}
enum QuantityDays: Int {
    case tree = 3
    case five = 5
    case ten = 10
    case fifteen = 15
}

class PaisViewModel: ViewModelType {
    weak var viewDisplay: PRViewController?
    
    var country: Country?
    var countryCompare: Country?
    var historical: Historical?
    var historicalCountryCompare: Historical?
    var isComparing: Bool = false
    var quantityDays: QuantityDays = .tree
    var items: [[String: String]] = []
    
    init(country: Country?, historical: Historical?) {
        self.country = country
        self.historical = historical
        self.makeItems()
    }
    
    private func getValuesForChart(historical: Historical?, type: HistoricalType = .cases, lastDays: QuantityDays) -> [ChartDataEntry] {
        guard let values = type == .cases ? historical?.timeline?.cases : historical?.timeline?.deaths else { return []}
        let sortedValues = values.sorted { (obj1, obj2) -> Bool in
            return Int(obj1.key.replacingOccurrences(of: "/", with: "")) ?? 0 > Int(obj2.key.replacingOccurrences(of: "/", with: "")) ?? 0
        }
        var valuesLastDay = sortedValues
        valuesLastDay = self.getNumberOfDays(values: valuesLastDay)
        // por dia
        
        if (lastDays.rawValue < valuesLastDay.count) {
            valuesLastDay = valuesLastDay.prefix(lastDays.rawValue).reversed()
        } else {
            valuesLastDay = valuesLastDay.reversed()
        }
        var valuesChart: [ChartDataEntry] = []
        for (i, value) in valuesLastDay.enumerated(){
            valuesChart.append(ChartDataEntry(x: Double(i), y: Double(value.value), icon: nil))
        }
        return valuesChart
    }
    
    func getNumberOfDays(values: [(key: String, value: Int64)]) -> [(key: String, value: Int64)] {
        var valuesPerDay : [(key: String, value: Int64)] = []
        let valuesAll = values.reversed()
        var lastValue: Int64 = 0
        for value in valuesAll {
            valuesPerDay.append((key: value.key, value: value.value-lastValue))
            lastValue = value.value
        }
        return valuesPerDay.reversed()
    }
    
    func getValuesForChartCurrentCountry(type: HistoricalType = .cases, lastDay: QuantityDays?) -> [ChartDataEntry] {
        return self.getValuesForChart(
            historical: self.historical,
            type: type,
            lastDays: lastDay ?? .tree
        )
    }
    
    func getValuesForChartCompare(type: HistoricalType = .cases, lastDay: QuantityDays?) -> [ChartDataEntry] {
        return self.getValuesForChart(
            historical: self.historicalCountryCompare,
            type: type,
            lastDays: lastDay ?? .tree
        )
    }
    
    func setQuantityDay(index: Int) {
        self.quantityDays = QuantityDays(rawValue: index) ?? .tree
        self.viewDisplay?.refreshView()
    }
    
    private func makeItems() {
        guard let country = self.country else {return}
        self.items.removeAll()
        self.items.append(["Casos": country.cases.formatarMilhar])
        self.items.append(["Mortes": country.deaths.formatarMilhar])
        self.items.append(["Recuperados": country.recovered.formatarMilhar])
        self.items.append(["Criticos": country.critical?.formatarMilhar ?? "-"])
        self.items.append(["Casos Hoje": country.todayCases.formatarMilhar])
        self.items.append(["Mortes Hoje": country.todayDeaths.formatarMilhar])
        self.viewDisplay?.refreshView()
    }
    
    private func getDateDays(substractDays: Bool = false) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        if substractDays {
            let subs = Calendar.current.date(byAdding: .day, value: -self.quantityDays.rawValue, to: yesterday) ?? Date()
            return formatter.string(from: subs)
        }
        return formatter.string(from: yesterday)
    }
    
    var title: String {
        let currentCountry = self.country?.country ?? ""
        let compareCountry = self.countryCompare?.country ?? ""
        if !compareCountry.isEmpty {
            return currentCountry + " x " + compareCountry
        }
        return currentCountry
    }
    
    var deathsToday: String {
        return self.country?.todayDeaths.formatarMilhar ?? "-"
    }
    
    var casesToday: String {
        return self.country?.todayCases.formatarMilhar ?? "-"
    }
    
    var casesAll: String {
        return self.country?.cases.formatarMilhar ?? "-"
    }
    
    var deathsAll: String {
        return self.country?.deaths.formatarMilhar ?? "-"
    }
    
    var legendToCases: String {
        return "Casos " + self.getDateDays(substractDays: true) + " e " + self.getDateDays()
    }
    var legendToDeaths: String {
        return "Mortes " + self.getDateDays(substractDays: true) + " e " + self.getDateDays()
    }
}
