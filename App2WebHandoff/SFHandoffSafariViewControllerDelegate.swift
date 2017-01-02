//
//  SFHandoffSafariViewControllerDelegate.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import SafariServices

open class SFHandoffSafariViewControllerDelegate: NSObject {

}

extension SFHandoffSafariViewControllerDelegate: SFSafariViewControllerDelegate {

    open func safariViewController(_ controller: SFSafariViewController, didCompleteInitialLoad didLoadSuccessfully: Bool) {
        if didLoadSuccessfully {
            controller.userActivity?.becomeCurrent()
        }
    }

    open func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.userActivity?.resignCurrent()
    }
    
}
