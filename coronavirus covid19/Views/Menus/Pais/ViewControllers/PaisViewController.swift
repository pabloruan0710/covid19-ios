//
//  PaisViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import WebKit

class PaisViewController: PRViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        webView.load(URLRequest(url: (URL(string: "https://covid.amcharts.com/")!)))
        
       }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          let js =
                      """
              var meta = document.createElement('meta'); meta.setAttribute( 'name', 'viewport' ); meta.setAttribute( 'content', 'width = device-width, initial-scale = 1.0, user-scalable = yes');document.getElementsByTagName('head')[0].appendChild(meta)
              """

                      webView.evaluateJavaScript(js, completionHandler: nil)
    }
}
