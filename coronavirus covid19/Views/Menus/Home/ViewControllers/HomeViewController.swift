//
//  HomeViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class HomeViewController: PRViewController {

    @IBOutlet weak var cardInfo: InfoGenericView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel?
    
    override init(viewModel: ViewModelType?) {
        self.viewModel = viewModel as? HomeViewModel
        super.init(viewModel: viewModel)
        self.viewModel?.viewDisplay = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    
    func setupTableView() {
        self.tableView.register(CountryTableViewCell.loadNib(),
                                forCellReuseIdentifier: CountryTableViewCell.identifier())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier()) as! CountryTableViewCell
        
        return cell
    }
}
