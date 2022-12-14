//
//  PetDetailViewController.swift
//  PetsApp
//
//  Created by Sheeja Sagar on 12/13/22.
//

import UIKit
import WebKit

class PetDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var webView: WKWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Costants
    private let screenTitle = "Pet Detail"
    
    // MARK: - Declarations
    var pet : PetData?
    
    // MARK: - View Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadData()
    }
    
    // MARK: - Custom Methods
    func initView() {
        self.title = screenTitle
        self.webView.navigationDelegate = self
        activityIndicator.style = .large
    }
    
    func loadData() {
        if let pet = pet, let url = URL(string: pet.contentURL) {
            webView?.load(URLRequest(url: url))
            webView?.allowsBackForwardNavigationGestures = true
        }
    }
    
    func showActivityIndicator(show: Bool) {
        activityIndicator?.isHidden = !show
        if show {
            activityIndicator?.startAnimating()
        } else {
            activityIndicator?.stopAnimating()
        }
    }
}

// MARK: - WKNavigationDelegate Methods
extension PetDetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        showActivityIndicator(show: false)
    }
}
