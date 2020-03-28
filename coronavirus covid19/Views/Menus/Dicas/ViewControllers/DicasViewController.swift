//
//  DicasViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class DicasViewController: PRViewController {

    var viewModel: DicasViewModel?
    
    override init(viewModel: ViewModelType?) {
        self.viewModel = viewModel as? DicasViewModel
        super.init(viewModel: viewModel)
        self.viewModel?.viewDisplay = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel?.getAllTips()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
