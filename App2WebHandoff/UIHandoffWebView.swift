//
//  UIHandoffWebView.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import UIKit

open class UIHandoffWebView: UIWebView {

    private let handoffDelegate = UIHandoffWebViewDelegate()

    override public init(frame: CGRect) {
        super.init(frame: frame)
        delegate = handoffDelegate
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = handoffDelegate
    }

    convenience public init() {
        self.init(frame: .zero)
    }

}
