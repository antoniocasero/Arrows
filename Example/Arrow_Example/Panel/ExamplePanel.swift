//
//  PanelMaterial.swift
//  Panels_Example
//
//  Created by Antonio Casero on 30.09.18.
//  Copyright © 2018 Antonio Casero. All rights reserved.
//

import UIKit
import Panels
import Arrows

class ExamplePanel: UIViewController, Panelable {
    @IBOutlet var headerHeight: NSLayoutConstraint!
    @IBOutlet var headerPanel: UIView!
    @IBOutlet weak var arrow: ArrowView!

    override func viewDidLoad() {
        curveTopCorners()
        self.view.layoutIfNeeded()
        super.viewDidLoad()
    }
    
}

extension ExamplePanel: PanelNotifications {
    func panelDidPresented() {
        arrow.update(to: .middle, animated: true)
    }

    func panelDidCollapse() {
        arrow.update(to: .up, animated: true)
    }

    func panelDidOpen() {
        arrow.update(to: .down, animated: true)
    }

    
}
