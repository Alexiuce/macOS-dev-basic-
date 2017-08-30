//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Alexcai on 2017/8/30.
//  Copyright © 2017年 Alexcai. All rights reserved.
//

import Cocoa

import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var loadProgress: NSTextField!
    
    @IBOutlet weak var webView: WebView!
    @IBOutlet weak var forwardBtn: NSButton!
    
    @IBOutlet weak var refreshBtn: NSButton!
    @IBOutlet weak var backBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(statLoadingProgress), name:.WebViewProgressStarted, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changedProgress), name:.WebViewProgressEstimateChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(fininshedProgress), name:.WebViewProgressFinished, object: nil)
        
        
        
        
        
        
        let url = URL(string: "https://sspai.com")
        let request = URLRequest(url: url!)
        
        
        // webVeiw 加载request 请求的方法
        webView.mainFrame.load(request)

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear() {
        super.viewDidAppear()
        forwardBtn.isEnabled = webView.canGoForward
        backBtn.isEnabled = webView.canGoBack
    }
    

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func goForward(_ sender: NSButton) {
        webView.goForward()
    }
    
    @IBAction func goback(_ sender: NSButton) {
        webView.goBack()
    }
    @IBAction func refresh(_ sender: NSButton) {
        webView.reload(nil)
    }
    

}


extension ViewController : WebFrameLoadDelegate{
    // webView 已经加载完毕时,会调用这个代理方法
    func webView(_ sender: WebView!, didFinishLoadFor frame: WebFrame!) {
        print("webview 加载完毕")
        forwardBtn.isEnabled = webView.canGoForward
        backBtn.isEnabled = webView.canGoBack
    }
}
// MARK: -  监听webView的加载进度
extension ViewController{
    // 1. webView 开始加载进度
    
    func statLoadingProgress()  {
        loadProgress.stringValue = "\(webView.estimatedProgress)"
        
    }
    
    // 2. webView 更新加载进度
    func changedProgress()  {
         loadProgress.stringValue = "\(webView.estimatedProgress)"
        
    }

    // 3. webView 完成加载进度
    func fininshedProgress() {
     loadProgress.stringValue = "1.0"
    
    }
    
}

// MARK: - Policy Delegate : 控制webView 是否可以加载url的策略

extension ViewController : WebPolicyDelegate{
    
    
    // 是否可以加载request这个请求,webView每次加载请求时,都会调用代理的这个方法进行判断
    func webView(_ webView: WebView!, decidePolicyForNavigationAction actionInformation: [AnyHashable : Any]!, request: URLRequest!, frame: WebFrame!, decisionListener listener: WebPolicyDecisionListener!) {
        print("是否可以加载此请求\(request.url?.absoluteString)")
        listener.use()  // 这个表示,该request可以加载
//        listener.ignore()  // 这个表示忽略加载该request
    }
    // 判断MIME这种资源是否可以支持加载
    func webView(_ webView: WebView!, decidePolicyForMIMEType type: String!, request: URLRequest!, frame: WebFrame!, decisionListener listener: WebPolicyDecisionListener!) {
        print("是否可以加载此类型\(type)")
        listener.use()
//        listener.ignore()
    }
    // 是否可以使用新窗口加载请求
    func webView(_ webView: WebView!, decidePolicyForNewWindowAction actionInformation: [AnyHashable : Any]!, request: URLRequest!, newFrameName frameName: String!, decisionListener listener: WebPolicyDecisionListener!) {
        print("是否开新窗口加载此请求\(request.url?.absoluteString)")
        listener.use()

    }
    
}



