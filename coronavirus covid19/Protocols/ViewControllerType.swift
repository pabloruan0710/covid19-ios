//
//  ViewControllerType.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation

protocol ViewControllerType: class {
    func showLoading()
    func hideLoading()
    func showError(msg: String?)
    func refreshView()
}


