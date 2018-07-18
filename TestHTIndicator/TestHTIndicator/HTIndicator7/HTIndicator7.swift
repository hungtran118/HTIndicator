//
//  HTIndicator6.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 5/31/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicator7 {
    
    //MARK:- SUPPORT VARIABLES
    static let shared = HTIndicator7()
    private let containerView = UIView()
    private let indicator = HTIndicatorView7(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    private var isShowing = false
    
    //MARK: - Main functions
    private init() {}
    
    func show() {
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        if !isShowing {
            
            isShowing = true
            
            containerView.frame = keyWindow.frame
            containerView.center = keyWindow.center
            containerView.backgroundColor = UIColor(white: 0, alpha: 0.3)
            
            indicator.center = containerView.center
            indicator.color = UIColor(red: 0.5, green: 1, blue: 1, alpha: 1)
            indicator.startAnimate()
            containerView.addSubview(indicator)
            
            keyWindow.addSubview(containerView)
            
        }
    }
    
    func hide() {
        isShowing = false
        containerView.removeFromSuperview()
        indicator.removeFromSuperview()
    }
}









