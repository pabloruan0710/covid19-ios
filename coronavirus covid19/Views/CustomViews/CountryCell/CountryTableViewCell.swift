//
//  CountryTableViewCell.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import Kingfisher

class CountryTableViewCell: UITableViewCell {

    class func loadNib()->UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    class func identifier()->String{
        return String(describing: self)
    }
    
    @IBOutlet weak var lbTitleQtd: UILabel!
    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var flag: UILabel!
    @IBOutlet weak var lbPais: UILabel!
    @IBOutlet weak var lbInfectados: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCountryData(country: Country) {
        lbPais.text = country.country
        lbInfectados.text = country.cases.formatarMilhar
        flag.text = country.country?.prefix(2).capitalized
        
        guard let image = URL(string: country.countryInfo?.flag ?? "") else {
            self.imageFlag.isHidden = true
            self.flag.isHidden = false
            return
        }
        self.flag.isHidden = true
        self.imageFlag.isHidden = false
        imageFlag.kf.setImage(with: image)
    }
    
    func setupCountryDetail(values: [String: String], country: Country?) {
        self.lbPais.text = values.keys.first
        self.lbInfectados.text = values.values.first
        self.lbTitleQtd.text = values.keys.first
        self.flag.text = country?.country?.prefix(3).uppercased()
        self.accessoryType = .none
    }
}
