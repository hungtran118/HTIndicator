//
//  ViewController2.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/26/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var htIndicator1: HTIndicatorView!
    @IBOutlet weak var htIndicator2: HTIndicatorView2!
    @IBOutlet weak var htIndicator3: HTIndicatorView3!
    @IBOutlet weak var htIndicator4: HTIndicatorView4!
    @IBOutlet weak var htIndicator5: HTIndicatorView5!
    @IBOutlet weak var htIndicator6: HTIndicatorView6!
    @IBOutlet weak var htIndicator7: HTIndicatorView7!
    
    override func viewDidLoad() {
        navigationItem.title = "All Indicator"
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        htIndicator1.startAnimate()
        htIndicator2.startAnimate()
        htIndicator3.startAnimate()
        htIndicator4.startAnimate()
        htIndicator5.startAnimate()
        htIndicator6.startAnimate()
        htIndicator7.startAnimate()
    }
}
