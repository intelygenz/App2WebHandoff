//
//  App2WebHandoffTests.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import XCTest
import WebKit
import SafariServices
@testable import App2WebHandoff

class UIHandoffWebViewDelegateMock: UIHandoffWebViewDelegate {

    var didStartLoadCalled = false
    var shouldStartLoadCalled = false

    open override func webViewDidStartLoad(_ webView: UIWebView) {
        didStartLoadCalled = true
        super.webViewDidStartLoad(webView)
    }

    open override func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        shouldStartLoadCalled = true
        return super.webView(webView, shouldStartLoadWith: request, navigationType: navigationType)
    }

}

class WKHandoffDelegateMock: WKHandoffDelegate {

    var didStartProvisionalNavigationCalled = false
    var didFailProvisionalNavigationCalled = false
    var didCommitCalled = false
    var didFailCalled = false
    var navigation: WKNavigation!

    open override func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.navigation = navigation
        didStartProvisionalNavigationCalled = true
        super.webView(webView, didStartProvisionalNavigation: navigation)
    }

    open override func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.navigation = navigation
        didFailProvisionalNavigationCalled = true
        super.webView(webView, didFailProvisionalNavigation: navigation, withError: error)
    }

    open override func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.navigation = navigation
        didCommitCalled = true
        super.webView(webView, didCommit: navigation)
    }

    open override func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.navigation = navigation
        didFailCalled = true
        super.webView(webView, didFail: navigation, withError: error)
    }

}

class SFHandoffSafariViewControllerDelegateMock: SFHandoffSafariViewControllerDelegate {

    var didCompleteInitialLoadCalled = false
    var didFinishCalled = false

    open override func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        didCompleteInitialLoadCalled = true
        super.safariViewController(controller, didCompleteInitialLoad: didLoadSuccessfully)
    }

    open override func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        didFinishCalled = true
        super.safariViewControllerDidFinish(controller)
    }

}

class App2WebHandoffTests: XCTestCase {

    let testURL = URL(string: "http://www.intelygenz.es/")!
    
    override func setUp() {
        super.setUp()
    }
    
    func testUIHandoffWebView() {
        let handoff = UIHandoffWebView()
        handoff.loadRequest(URLRequest(url: testURL))
        XCTAssertTrue(handoff.delegate is UIHandoffWebViewDelegate)
    }

    func testUIHandoffWebViewDelegate() {
        let handoff = UIHandoffWebView()
        let delegate = UIHandoffWebViewDelegateMock()
        handoff.delegate = delegate
        handoff.loadRequest(URLRequest(url: testURL))
        XCTAssertTrue(delegate.webView(handoff, shouldStartLoadWith: URLRequest(url: testURL), navigationType: .other))
        XCTAssertTrue(delegate.shouldStartLoadCalled)
        XCTAssertTrue(handoff.userActivity?.webpageURL == testURL)
        delegate.webViewDidStartLoad(handoff)
        XCTAssertTrue(delegate.didStartLoadCalled)
        XCTAssertTrue(handoff.userActivity?.webpageURL == testURL)
    }

    func testWKHandoffWebView() {
        let handoff = WKHandoffWebView()
        handoff.load(URLRequest(url: testURL))
        XCTAssertTrue(handoff.navigationDelegate is WKHandoffDelegate)
    }

    func testWKHandoffDelegate() {
        let handoff = WKHandoffWebView()
        let delegate = WKHandoffDelegateMock()
        handoff.navigationDelegate = delegate
        let error = NSError(domain: "", code: 0, userInfo: nil)
        handoff.load(URLRequest(url: testURL))
        delegate.webView(handoff, didStartProvisionalNavigation: delegate.navigation)
        XCTAssertTrue(delegate.didStartProvisionalNavigationCalled)
        XCTAssertTrue(handoff.userActivity?.webpageURL == testURL)
        delegate.webView(handoff, didFailProvisionalNavigation: delegate.navigation, withError: error)
        XCTAssertTrue(delegate.didFailProvisionalNavigationCalled)
        XCTAssertNil(handoff.userActivity?.webpageURL)
        delegate.webView(handoff, didCommit: delegate.navigation)
        XCTAssertTrue(delegate.didCommitCalled)
        XCTAssertTrue(handoff.userActivity?.webpageURL == testURL)
        delegate.webView(handoff, didFail: delegate.navigation, withError: error)
        XCTAssertTrue(delegate.didFailCalled)
        XCTAssertNil(handoff.userActivity?.webpageURL)
    }

    func testSFHandoffSafariViewController() {
        let handoff = SFHandoffSafariViewController(url: testURL)
        XCTAssertTrue(handoff.delegate is SFHandoffSafariViewControllerDelegate)
    }

    func testSFHandoffSafariViewControllerDelegate() {
        let handoff = SFHandoffSafariViewController(url: testURL)
        let delegate = SFHandoffSafariViewControllerDelegateMock()
        handoff.delegate = delegate
        delegate.safariViewController(handoff, didCompleteInitialLoad: true)
        XCTAssertTrue(delegate.didCompleteInitialLoadCalled)
        XCTAssertTrue(handoff.userActivity?.webpageURL == testURL)
        delegate.safariViewControllerDidFinish(handoff)
        XCTAssertTrue(delegate.didFinishCalled)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
}
