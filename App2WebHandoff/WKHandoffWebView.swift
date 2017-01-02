//
//  WKHandoffWebView.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import WebKit

open class WKHandoffWebView: WKWebView {

    private let handoffDelegate = WKHandoffDelegate()

    override public init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        navigationDelegate = handoffDelegate
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        navigationDelegate = handoffDelegate
    }

    convenience public init() {
        self.init(frame: .zero, configuration: WKWebViewConfiguration())
    }

}
