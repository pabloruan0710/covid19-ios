//
//  PaisViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import WebKit
import Charts



class PaisViewController: PRViewController, ChartViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chart: LineChartView!
    @IBOutlet weak var lbEnfectadosHj: UILabel!
    @IBOutlet weak var cardChard: UIView!
    @IBOutlet weak var lbMortesHj: UILabel!
    @IBOutlet weak var cardInfectados: UIView!
    @IBOutlet weak var cardMortes: UIView!
    @IBOutlet weak var cardTotalCasos: UIView!
    @IBOutlet weak var cardTotalMortes: UIView!
    @IBOutlet weak var lbTotalCasos: UILabel!
    @IBOutlet weak var lbTotalMortes: UILabel!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var segmentedDays: UISegmentedControl!
    
    var viewModel: PaisViewModel?
    
    override init(viewModel: ViewModelType?) {
        self.viewModel = viewModel as? PaisViewModel
        super.init(viewModel: viewModel)
        self.viewModel?.viewDisplay = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.setupChart()
        self.refreshChartData()
        self.setupInfoData()
        self.setupCardShadow()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func refreshView() {
        self.setupInfoData()
        self.refreshChartData()
        self.tableView.reloadData()
    }
    
    func setupTableView() {
        self.tableView.register(CountryTableViewCell.loadNib(),
                                forCellReuseIdentifier: CountryTableViewCell.identifier())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
    }
    
    func setupChart() {
        ChartCOVID.createLineChart(chart: self.chart, delegate: self)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.segmentedDays.selectedSegmentIndex = 2
        self.segmentedDays.setTitleTextAttributes(titleTextAttributes, for: .selected)
        self.segmentedDays.sendActions(for: .valueChanged)
        
        self.lbMortesHj.adjustsFontSizeToFitWidth = true
        self.lbEnfectadosHj.adjustsFontSizeToFitWidth = true
        self.lbTotalCasos.adjustsFontSizeToFitWidth = true
        self.lbTotalMortes.adjustsFontSizeToFitWidth = true
    }
    
    func setupCardShadow() {
        self.cardMortes.shadownDefault()
        self.cardInfectados.shadownDefault()
        self.cardTotalCasos.shadownDefault()
        self.cardTotalMortes.shadownDefault()
        
    }
    
    func setupInfoData() {
        self.lbMortesHj.text = self.viewModel?.deathsToday
        self.lbEnfectadosHj.text = self.viewModel?.casesToday
        self.lbTotalCasos.text = self.viewModel?.casesAll
        self.lbTotalMortes.text = self.viewModel?.deathsAll
        self.lbTitulo.text = self.viewModel?.title
    }
    
    private func setChartData() {
        chart.animate(xAxisDuration: 0.5)
        let cases = self.viewModel?.getValuesForChartCurrentCountry(
            type: .cases,
            lastDay: self.viewModel?.quantityDays
            ) ?? []
        let deaths = self.viewModel?.getValuesForChartCurrentCountry(
            type: .deaths,
            lastDay: self.viewModel?.quantityDays
            ) ?? []
        let casesSet = ChartCOVID.getSetChart(values: cases, label: self.viewModel?.legendToCases ?? "", gradientColors: [.white, .orange])
        let deathsSet = ChartCOVID.getSetChart(values: deaths, label: self.viewModel?.legendToDeaths ?? "", gradientColors: [.white, .red])
        let data = LineChartData(dataSets: [casesSet, deathsSet])
        chart.data = data
    }
    
    func refreshChartData() {
        self.setChartData()
    }
    @IBAction func segmentedDaysChange(_ sender: Any) {
        if let days = segmentedDays
            .titleForSegment(at: segmentedDays.selectedSegmentIndex)?
            .replacingOccurrences(of: " Dias", with: ""),
            let dias = Int(days) {
            self.viewModel?.setQuantityDay(index: dias)
        }
    }
}

extension PaisViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.identifier()) as! CountryTableViewCell
        guard let countryDetail = self.viewModel?.items[indexPath.row] else {return cell}
        cell.setupCountryDetail(values: countryDetail, country: self.viewModel?.country)
        return cell
    }
    
}
