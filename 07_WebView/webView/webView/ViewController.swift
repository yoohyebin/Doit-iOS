//
//  ViewController.swift
//  webView
//
//  Created by 유혜빈 on 2022/10/04.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webKitView.navigationDelegate = self
        loadWebPage("https://hyebin218.notion.site/About-Hyebin-f91d225d7aef4b7595c37220d8defb0a")
    }
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        self.webKitView.load(myRequest)
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://") || strUrl.hasPrefix("https://")
        
        if !flag{
            strUrl = "http://" + strUrl
        }
        
        return strUrl
    }

    @IBAction func tapGoButton(_ sender: UIButton) {
        let myUrl = checkUrl(self.textField.text!)
        self.textField.text = " "
        loadWebPage(myUrl)
    }
    
    @IBAction func tapFirstSiteButton(_ sender: UIButton) {
        loadWebPage("https://codingga-dingga.tistory.com/")
    }
    
    @IBAction func tapSecondSiteButton(_ sender: UIButton) {
        loadWebPage("https://github.com/yoohyebin")
    }
    
    @IBAction func tapHTMLButton(_ sender: UIButton) {
        let htmlString = """
            <h1>HTML String</h1>
            <p>String 변수를 이용한 웹페이지</p>
            <p><a href = \"https://hyebin218.notion.site/About-Hyebin-f91d225d7aef4b7595c37220d8defb0a\">About</a>으로 이동</p>
        """
        self.webKitView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func tapFileButton(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(filePath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        self.webKitView.load(myRequest)
    }
    
    @IBAction func tapStopButton(_ sender: UIBarButtonItem) {
        self.webKitView.stopLoading()
    }
    
    @IBAction func tapReloadButton(_ sender: UIBarButtonItem) {
        self.webKitView.reload()
    }
    
    @IBAction func tapBackButton(_ sender: UIBarButtonItem) {
        self.webKitView.goBack()
    }
    
    @IBAction func tapForwardButton(_ sender: UIBarButtonItem) {
        self.webKitView.goForward()
    }
}

extension ViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.indicatorView.startAnimating()
        self.indicatorView.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.indicatorView.stopAnimating()
        self.indicatorView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.indicatorView.stopAnimating()
        self.indicatorView.isHidden = true
    }
}
