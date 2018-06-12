//
//  ViewController.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 5/29/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc func hideIndicator() {
        HTIndicator.shared.hide()
        HTIndicator2.shared.hide()
        HTIndicator3.shared.hide()
        HTIndicator4.shared.hide()
        HTIndicator5.shared.hide()
        HTIndicator6.shared.hide()
        AllIndicator.shared.hide()
    }
    
    @IBAction func startIndicator(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator.shared.show()
    }
    
    @IBAction func startIndicator2(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator2.shared.show()
    }
    @IBAction func startIndicator3(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator3.shared.show()
    }
    
    @IBAction func startIndicator4(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator4.shared.show()
    }
    
    @IBAction func startIndicator5(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator5.shared.show()
    }
    
    @IBAction func startIndicator6(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        HTIndicator6.shared.show()
    }
    
    @IBAction func ViewAllIndicator(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(hideIndicator), userInfo: nil, repeats: false)
        AllIndicator.shared.show()
    }
}











