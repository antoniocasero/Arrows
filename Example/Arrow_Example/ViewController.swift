//
//  ViewController.swift
//  Arrow_Example
//
//  Created by Antonio Casero on 28.09.18.
//  Copyright © 2018 Antonio Casero. All rights reserved.
//

import UIKit
import Arrows

class ViewController: UIViewController {

    @IBOutlet weak var panel: UIView!
    @IBOutlet weak var arrow: ArrowPanel!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeArrowPosition() {
        index = (index + 1 <  ArrowPanel.Position.allCases.count) ? index + 1 : 0
        let next = ArrowPanel.Position.allCases[index]
        arrow.update(to: next, animated: true)
    }
}

