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
    
    var longPressGesture = UILongPressGestureRecognizer()
    var allLayer: [CALayer] = []
    
    override func viewDidLoad() {
        navigationItem.title = "All Indicator"
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(pauseAndResumeAnimation))
        longPressGesture.minimumPressDuration = 0
        view.addGestureRecognizer(longPressGesture)
        
        allLayer = [htIndicator1.layer, htIndicator2.layer, htIndicator3.layer, htIndicator4.layer, htIndicator5.layer, htIndicator6.layer, htIndicator7.layer]
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
    
    @objc func pauseAndResumeAnimation() {
        if self.longPressGesture.state == .ended {
            resumeLayer(allLayer)
        } else {
            pauseLayer(allLayer)
        }
    }
    
    private func pauseLayer(_ layers: [CALayer]) {
        for layer in layers {
            let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
            layer.speed = 0.0
            layer.timeOffset = pausedTime
        }
    }
    
    private func resumeLayer(_ layers: [CALayer]) {
        for layer in layers {
            let pausedTime = layer.timeOffset
            layer.speed = 1
            layer.timeOffset = 0
            layer.beginTime = 0
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
        }
    }
}








