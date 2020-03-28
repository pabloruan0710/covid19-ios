//
//  HomeViewModel.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class HomeViewModel: ViewModelType {
    weak var viewDisplay: PRViewController?
    
    var globalItem: Global?
    var items: [Country] = []
    private var historicalAll: [Historical]?
    var historicalCountry: Historical?
    var heightForHeader: CGFloat = 408
    private var globalService: GlobalService?
    private var countryService: CountryService?
    private var historicalService: HistoricalService?
    private var casesDeathsUntilYesterday: (cases: Int64, deaths: Int64)?
    
    init(service: NetworkProtocolType?) {
        self.globalService = GlobalService(service: service)
        self.countryService = CountryService(service: service)
        self.historicalService = HistoricalService(service: service)
    }
    
    func changeHeightForHeader(scrollPercent: CGFloat) {
        self.heightForHeader = 408*scrollPercent
    }
    
    func getAllData() {
        self.getHistorical()
        self.getGlobalData()
        self.getCountriesData()
    }
    
    var taxaMortalidade: CGFloat {
        guard let glob = self.globalItem else { return 0.0 }
        return CGFloat(CGFloat(glob.deaths)/CGFloat(glob.cases))*100.00
    }
    
    var casesToday: String {
        let cases = Int64((self.globalItem?.cases ?? 0 ) - (casesDeathsUntilYesterday?.cases ?? 0))
        return cases > 0 ? cases.formatarMilhar : "-"
    }
    var deathsToday: String {
        let deaths = Int64((self.globalItem?.deaths ?? 0 ) - (casesDeathsUntilYesterday?.deaths ?? 0))
        return deaths > 0 ? deaths.formatarMilhar : "-"
    }
    
    private func getGlobalData() {
        self.viewDisplay?.showLoading()
        self.globalService?.getAll(completion: { (global) in
            self.globalItem = global
            self.refreshView()
        })
    }
    
    private func getCountriesData() {
        self.viewDisplay?.showLoading()
        self.countryService?.getAll(completion: { (countries) in
            self.items = countries
            self.refreshView()
        })
    }
    
    private func getHistorical() {
        self.historicalService?.getAll(completion: { (historical) in
            self.historicalAll = historical ?? []
            self.casesDeathsUntilYesterday = self.historicalService?
                .getCasesDeathsUntilYesterday(historical: self.historicalAll ?? [])
            self.refreshView()
        })
    }
    
    private func refreshView() {
        DispatchQueue.main.async {
            self.viewDisplay?.hideLoading()
            self.viewDisplay?.refreshView()
        }
    }
    
    func openDetailCountry(country: Country?) {
        guard let country = country else {return}
        self.historicalCountry = self.historicalService?.getSpecificCountry(
            country: country,
                historical: self.historicalAll
        )
        let viewModel = PaisViewModel(country: country, historical: self.historicalCountry)
        let vc = PaisViewController(viewModel: viewModel)
        
        if #available(iOS 13.0, *) {
            self.viewDisplay?.present(vc, animated: true, completion: {
                self.historicalCountry = nil
            })
        } else {
            let navigation = self.viewDisplay?.navigationController
            navigation?.navigationBar.isHidden = false
            navigation?.navigationBar.prefersLargeTitles = false
            navigation?.navigationBar.isTranslucent = false
            navigation?.pushViewController(vc, animated: true)
        }
    }
}
