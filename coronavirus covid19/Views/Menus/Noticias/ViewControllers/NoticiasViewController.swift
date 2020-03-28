//
//  NoticiasViewController.swift
//  coronavirus covid19
//
//  Created by Pablo Ruan on 24/03/20.
//  Copyright © 2020 Pablo Ruan. All rights reserved.
//

import UIKit
import WebKit

class NoticiasViewController: PRViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let htmlContent = """
            <meta name='viewport' content='initial-scale=1.0'/>
            <a class="twitter-timeline" href="https://twitter.com/minsaude?ref_src=twsrc%5Etfw"></a> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
            """
        webView.navigationDelegate = self
        webView.loadHTMLString(htmlContent, baseURL: nil)
        self.showLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideLoading()
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      if navigationAction.navigationType == .linkActivated  {
        if let url = navigationAction.request.url,
        UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
          decisionHandler(.cancel)
        } else {
          decisionHandler(.allow)
          }
      } else {
          decisionHandler(.allow)
         }
    }
}
