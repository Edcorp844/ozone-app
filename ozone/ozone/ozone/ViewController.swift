//
//  ViewController.swift
//  ozone
//
//  Created by Frost Edson on 18/05/2022.
//

import UIKit
import WebKit
import Network

class ViewController: UIViewController {

    let webView = WKWebView()
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        if #available(iOS 12.0, *) {
            if NetworkMonitor.shared.isConnected {
                guard let url = URL(string: "https://www.ozone-online.com") else {
                    return
                }
                self.webView.load(URLRequest(url: url))
            }
            else {
                
                let url = Bundle.main.url(forResource: "indexx", withExtension: "html", subdirectory: "web")!
                self.webView.loadFileURL(url, allowingReadAccessTo: url)
                let request = URLRequest(url: url)
                self.webView.load(request)
            }
            
        } else {
            // Fallback on earlier versions
            guard let url = URL(string: "https://www.ozone-online.com") else {
                return
            }
            self.webView.load(URLRequest(url: url))
        }
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
}


