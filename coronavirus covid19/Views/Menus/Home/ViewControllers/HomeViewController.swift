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
    @IBOutlet weak var viewHeaderOpacity: UIView!
    var push: UIRefreshControl?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getAllData()
    }
    
    
    func setupTableView() {
        self.tableView.register(CountryTableViewCell.loadNib(),
                                forCellReuseIdentifier: CountryTableViewCell.identifier())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = .clear
        self.viewHeaderOpacity.alpha = 0.0
        self.push = UIRefreshControl()
        push?.addTarget(self, action: #selector(getAllData), for: .valueChanged)
        self.tableView.addSubview(push!)
    }
    
    override func refreshView() {
        self.push?.endRefreshing()
        self.refreshInfographicData()
        self.tableView.reloadData()
    }
    
    @objc func getAllData() {
        self.viewModel?.getAllData()
    }
    
    private func refreshInfographicData() {
        guard let global = self.viewModel?.globalItem else { return }
        cardInfo.setTotalInfectados(total: global.cases.formatarMilhar)
        cardInfo.setTotalRecuperados(recuperados: global.recovered.formatarMilhar)
        cardInfo.setTotalMortes(mortes: global.deaths.formatarMilhar)
        cardInfo.setValorCircular(valor: self.viewModel?.taxaMortalidade ?? 0)
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
        guard let country = self.viewModel?.items[indexPath.row] else {return cell}
        cell.setupCountryData(country: country)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 408
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vie = UIView()
        vie.backgroundColor = .clear
        return vie
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let alfa = (scrollView.contentOffset.y*1.3)/self.viewHeaderOpacity.frame.height
        if alfa <= 1 {
            UIView.animate(withDuration: 0.1) {
                self.viewHeaderOpacity.alpha = alfa
            }
        }
    }
}
