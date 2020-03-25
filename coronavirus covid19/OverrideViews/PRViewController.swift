//
//  PRViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import MBProgressHUD

class PRViewController: UIViewController {
    
    private var hud : MBProgressHUD?
    
    init(viewModel: ViewModelType?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initHudLoad()
    }

    private func initHudLoad() {
        hud = MBProgressHUD(view: self.view)
        hud?.mode = .indeterminate
        hud?.label.text = "Aguarde"
        
    }
}

extension PRViewController: ViewControllerType {
    func showLoading() {
        hud?.show(animated: true)
    }
    
    func hideLoading() {
        hud?.hide(animated: true)
    }
    
    func showError(msg: String?) {
        self.showAlert(title: "Atenção", msg: msg)
    }
    
    func refreshView() {
    }
}
