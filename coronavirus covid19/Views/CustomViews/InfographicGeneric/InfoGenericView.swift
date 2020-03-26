//
//  InfoGenericView.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import UICircularProgressRing

@IBDesignable
class InfoGenericView: UIView {

    var contentView:UIView?
    
    @IBOutlet weak var lbTotalInfectados: UILabel!
    @IBOutlet weak var lbTotalMortes: UILabel!
    @IBOutlet weak var lbTotalRecuperados: UILabel!
    @IBOutlet weak var lbTotalRecuperadosHoje: UILabel!
    @IBOutlet weak var lbTotalMortosHoje: UILabel!
    @IBOutlet weak var lbTotalInfectadosHoje: UILabel!
    @IBOutlet weak var cardProgress: UICircularProgressRing!
    @IBOutlet weak var cardShadown: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
        //roundCorners(corners: [.topLeft, .topRight], radius: 10.0)
        shadownSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
    }

    private func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
         view.autoresizingMask =
                    [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "InfoGenericView", bundle: bundle)
        return nib.instantiate(
                    withOwner: self,
                    options: nil).first as? UIView
    }
    
    func setValorCircular(valor: CGFloat) {
        //cardProgress.value = valor
        if valor == 0 {
            self.cardProgress.shouldShowValueText = false
        } else {
            self.cardProgress.shouldShowValueText = true
        }
        print(valor)
        cardProgress.startProgress(to: valor, duration: 2.0) {
        }
    }
    
    func shadownSetup() {
        cardShadown.layer.cornerRadius = 10
        cardShadown.layer.masksToBounds = false
        cardShadown.layer.shadowColor = UIColor.black.cgColor
        cardShadown.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardShadown.layer.shadowRadius = 10
        cardShadown.layer.shadowOpacity = 0.1
       }
    
    func setTotalInfectados(total: String) {
        self.lbTotalInfectados.text = total
    }

    func setTotalMortes(mortes: String) {
        self.lbTotalMortes.text = mortes
    }
    
    func setTotalRecuperados(recuperados: String) {
        self.lbTotalRecuperados.text = recuperados
    }
    
    func setInfectadosHoje(total: String) {
        self.lbTotalInfectadosHoje.text = total
    }

    func setMortesHoje(mortes: String) {
        self.lbTotalMortosHoje.text = mortes
    }
    
    func setRecuperadosHoje(recuperados: String) {
        self.lbTotalRecuperadosHoje.text = recuperados
    }
}
