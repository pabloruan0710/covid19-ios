//
//  UIViewController+Extension.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(title: String?, msg: String?, msgBt: String = "OK") {
        let alertController = UIAlertController(title: "Atenção", message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: msgBt, style: .default, handler: nil)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
