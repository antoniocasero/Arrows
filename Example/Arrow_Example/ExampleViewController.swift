//
//  ViewController.swift
//  Arrow_Example
//
//  Created by Antonio Casero on 28.09.18.
//  Copyright © 2018 Antonio Casero. All rights reserved.
//

import UIKit
import Arrows
import Panels

class ExampleViewController: UIViewController {

    @IBOutlet weak var panel: UIView!
    var index = 1
    lazy var panelManager = Panels(target: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        let panel = UIStoryboard.instantiatePanel(identifier: "ExamplePanel")
        panelManager.delegate = panel as? PanelNotifications
        panelManager.show(panel: panel)
    }

//    @IBAction func changeArrowPosition() {
//        index = (index + 1 <  ArrowPanel.Position.allCases.count) ? index + 1 : 0
//        let next = ArrowPanel.Position.allCases[index]
//        arrow.update(to: next, animated: true)
//    }
}
