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
    private var globalService: GlobalService?
    private var countryService: CountryService?
    
    init(service: NetworkProtocolType?) {
        self.globalService = GlobalService(service: service)
        self.countryService = CountryService(service: service)
    }
    
    func getAllData() {
        self.getGlobalData()
        self.getCountriesData()
    }
    
    var taxaMortalidade: CGFloat {
        guard let glob = self.globalItem else { return 0.0 }
        return CGFloat(CGFloat(glob.deaths)/CGFloat(glob.cases))*100.00
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
    
    private func refreshView() {
        DispatchQueue.main.async {
            self.viewDisplay?.hideLoading()
            self.viewDisplay?.refreshView()
        }
    }
}
