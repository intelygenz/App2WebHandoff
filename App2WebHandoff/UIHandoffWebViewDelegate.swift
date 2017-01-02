//
//  UIHandoffWebViewDelegate.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import UIKit

open class UIHandoffWebViewDelegate: NSObject {

}

extension UIHandoffWebViewDelegate: UIWebViewDelegate {

    open func webViewDidStartLoad(_ webView: UIWebView) {
        if webView.userActivity == nil && webView.request?.url?.scheme != nil {
            webView.userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
            webView.userActivity?.isEligibleForHandoff = true
            webView.userActivity?.webpageURL = webView.request?.url
        }
        webView.userActivity?.becomeCurrent()
    }

    open func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if webView.userActivity == nil && request.url?.scheme != nil {
            webView.userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
            webView.userActivity?.isEligibleForHandoff = true
            webView.userActivity?.webpageURL = request.url
        }
        webView.userActivity?.becomeCurrent()
        return true
    }

}

