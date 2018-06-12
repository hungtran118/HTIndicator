//
//  HTIndicator4.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 5/30/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicator4 {
    
    //MARK:- SUPPORT VARIABLES
    static let shared = HTIndicator4()
    private var keyWindow = UIWindow()
    private let containerView = UIView()
    private var indicatorView = UIView()
    
    //MARK: - Custom
    private let containerViewColor: UIColor = UIColor(white: 0, alpha: 0.3)
    private let indicatorSize: CGFloat = 60
    private let indicatorColor: UIColor = UIColor(red: 0.8, green: 0.8, blue: 0.3, alpha: 1)
    
    //MARK: - Main functions
    func show() {
        
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        self.keyWindow = keyWindow
        
        setupContainer()
        
        setupIndicatorView()
        
        setupIndicator()
    }
    
    func hide() {
        containerView.removeFromSuperview()
        indicatorView.removeFromSuperview()
    }
    
    //MARK: - Config
    private func setupContainer() {
        containerView.backgroundColor = containerViewColor
        containerView.frame = self.keyWindow.frame
        self.keyWindow.addSubview(containerView)
    }
    
    private func setupIndicatorView() {
        indicatorView = UIView(frame: CGRect(x: self.keyWindow.frame.midX - self.indicatorSize / 2, y: self.keyWindow.frame.midY - self.indicatorSize / 2, width: self.indicatorSize, height: self.indicatorSize))
        containerView.addSubview(indicatorView)
    }
    
    private func setupIndicator() {
        let indicator = HTIndicatorView4(frame: indicatorView.bounds)
        indicator.color = indicatorColor
        indicatorView.addSubview(indicator)
    }
}


















