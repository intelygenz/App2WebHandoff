//
//  SFHandoffSafariViewController.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import SafariServices

open class SFHandoffSafariViewController: SFSafariViewController {

    private let handoffDelegate = SFHandoffSafariViewControllerDelegate()

    override public init(url URL: URL, entersReaderIfAvailable: Bool) {
        super.init(url: URL, entersReaderIfAvailable: entersReaderIfAvailable)
        if userActivity == nil {
            userActivity = NSUserActivity(activityType: NSUserActivityTypeBrowsingWeb)
        }
        userActivity?.isEligibleForHandoff = true
        userActivity?.webpageURL = URL
        delegate = handoffDelegate
    }

    convenience public init(url URL: URL) {
        self.init(url: URL, entersReaderIfAvailable: false)
    }

}
