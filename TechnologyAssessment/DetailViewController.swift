//
//  DetailViewController.swift
//  TechnologyAssessment
//
//  Created by MACBOOK on 19/02/2020.
//  Copyright © 2020 MACBOOK. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let webURL = webURL {
            if let _ = webView {
                let url = URL(string: webURL )
                let request = URLRequest(url: url!)
                
                webView.navigationDelegate = self
                _ = webView.load(request)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    var webURL: String? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    
}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Strat to load for webView")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("finish to load for webView")
    }
    
    private func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error.localizedDescription)
    }
}
