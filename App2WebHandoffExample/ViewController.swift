//
//  ViewController.swift
//  App2WebHandoff
//
//  Created by alexruperez on 28/12/16.
//  Copyright © 2016 Intelygenz.
//

import UIKit
import App2WebHandoff

class ViewController: UIViewController {

    let exampleURL = URL(string: "http://www.intelygenz.es/")!

    @IBAction func uiAction(_ sender: UIButton) {
        let handoffWebView = UIHandoffWebView()
        let viewController = UIViewController()
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction(_:)))
        viewController.view = handoffWebView
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
        handoffWebView.loadRequest(URLRequest(url: self.exampleURL))
    }

    @IBAction func wkAction(_ sender: UIButton) {
        let handoffWebView = WKHandoffWebView()
        let viewController = UIViewController()
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction(_:)))
        viewController.view = handoffWebView
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true)
        handoffWebView.load(URLRequest(url: exampleURL))
    }

    @IBAction func sfAction(_ sender: UIButton) {
        let handoffSafariViewController = SFHandoffSafariViewController(url: exampleURL)
        present(handoffSafariViewController, animated: true)
    }

    @IBAction func doneAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }

}

