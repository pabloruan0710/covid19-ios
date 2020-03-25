//
//  CountryTableViewCell.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    class func loadNib()->UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    class func identifier()->String{
        return String(describing: self)
    }
    
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
        lbPais.text = country.pais
        lbInfectados.text = country.casos.description
        flag.text = country.pais.prefix(2).capitalized
    }
}
