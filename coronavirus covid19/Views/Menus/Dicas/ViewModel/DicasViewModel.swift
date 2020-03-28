//
//  DicasViewModel.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class DicasViewModel: ViewModelType {
    weak var viewDisplay: PRViewController?
    
    var tipService: TipsService?
    var items: [Tip]?
    
    init(service: NetworkProtocolType?) {
        self.tipService = TipsService(service: service)
    }
    
    func getAllTips() {
        self.viewDisplay?.showLoading()
        self.tipService?.getAll(completion: { (tips) in
            self.items = tips
            DispatchQueue.main.async {
                self.viewDisplay?.hideLoading()
                self.viewDisplay?.refreshView()
            }
        })
    }
}
