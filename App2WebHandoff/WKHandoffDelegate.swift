//
//  WKHandoffDelegate.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import WebKit

open class WKHandoffDelegate: NSObject {

}

extension WKHandoffDelegate: WKNavigationDelegate {

    open func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        becomeCurrent(webView)
    }

    open func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        invalidate(webView)
    }

    open func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        becomeCurrent(webView)
    }

    open func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        invalidate(webView)
    }

}

private extension WKHandoffDelegate {

    func becomeCurrent(_ webView: WKWebView) {
        if webView.userActivity == nil && webView.url?.scheme != nil {
            webView.userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
            webView.userActivity?.isEligibleForHandoff = true
            webView.userActivity?.webpageURL = webView.url
        }
        webView.userActivity?.becomeCurrent()
    }

    func invalidate(_ webView: WKWebView) {
        webView.userActivity?.invalidate()
        webView.userActivity = nil
    }

}
