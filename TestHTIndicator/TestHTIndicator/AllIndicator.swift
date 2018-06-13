//
//  AllIndicator.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 5/31/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

import UIKit

class AllIndicator {
    
    static let shared = AllIndicator()
    private let containerView = UIView()
    private var keyWindow = UIWindow()
    private var indicatorView = UIView()
    private var indicatorView2 = UIView()
    private var indicatorView3 = UIView()
    private var indicatorView4 = UIView()
    private var indicatorView5 = UIView()
    private var indicatorView6 = UIView()
    private var indicator6: HTIndicatorView6 = HTIndicatorView6()
    
    //MARK: - Custom
    private let containerViewColor: UIColor = UIColor(white: 0, alpha: 0.3)
    private let indicatorSize: CGFloat = 60
    
    //MARK: - Main functions
    func show() {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        self.keyWindow = keyWindow
        
        containerView.backgroundColor = containerViewColor
        containerView.frame = keyWindow.frame
        self.keyWindow.addSubview(containerView)
        
        indicatorView = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 / 3, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 100, width: self.indicatorSize, height: self.indicatorSize))
        indicatorView2 = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 100, width: self.indicatorSize, height: self.indicatorSize))
        indicatorView3 = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 * 1.7, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 100, width: self.indicatorSize, height: self.indicatorSize))
        indicatorView4 = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 / 3, y: (self.keyWindow.frame.height - self.indicatorSize) / 2, width: self.indicatorSize, height: self.indicatorSize))
        indicatorView5 = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2, y: (self.keyWindow.frame.height - self.indicatorSize) / 2, width: self.indicatorSize, height: self.indicatorSize))
        indicatorView6 = UIView(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 * 1.7, y: (self.keyWindow.frame.height - self.indicatorSize) / 2, width: self.indicatorSize, height: self.indicatorSize))
        containerView.addSubview(indicatorView)
        containerView.addSubview(indicatorView2)
        containerView.addSubview(indicatorView3)
        containerView.addSubview(indicatorView4)
        containerView.addSubview(indicatorView5)
        containerView.addSubview(indicatorView6)
        
        let indicator = HTIndicatorView(frame: indicatorView.bounds)
        indicator.startAnimate()
        indicatorView.addSubview(indicator)
        
        let indicator2 = HTIndicatorView2(frame: indicatorView2.bounds)
        indicator2.startAnimate()
        indicatorView2.addSubview(indicator2)
        
        let indicator3 = HTIndicatorView3(frame: indicatorView3.bounds)
        indicator3.startAnimate()
        indicatorView3.addSubview(indicator3)
        
        let indicator4 = HTIndicatorView4(frame: indicatorView4.bounds)
        indicator4.startAnimate()
        indicatorView4.addSubview(indicator4)
        
        let indicator5 = HTIndicatorView5(frame: indicatorView5.bounds)
        indicator5.startAnimate()
        indicatorView5.addSubview(indicator5)
        
        indicator6 = HTIndicatorView6(frame: indicatorView6.bounds)
        indicator6.startAnimate()
        indicatorView6.addSubview(indicator6)
        
        let lable1 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 / 3, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 150, width: self.indicatorSize, height: self.indicatorSize))
        lable1.text = "1"
        lable1.textColor = UIColor.white
        containerView.addSubview(lable1)
        
        let lable2 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 150, width: self.indicatorSize, height: self.indicatorSize))
        lable2.text = "2"
        lable2.textColor = UIColor.white
        containerView.addSubview(lable2)
        
        let lable3 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 * 1.7, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 150, width: self.indicatorSize, height: self.indicatorSize))
        lable3.text = "3"
        lable3.textColor = UIColor.white
        containerView.addSubview(lable3)
        
        let lable4 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 / 3, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 50, width: self.indicatorSize, height: self.indicatorSize))
        lable4.text = "4"
        lable4.textColor = UIColor.white
        containerView.addSubview(lable4)
        
        let lable5 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 50, width: self.indicatorSize, height: self.indicatorSize))
        lable5.text = "5"
        lable5.textColor = UIColor.white
        containerView.addSubview(lable5)
        
        let lable6 = UILabel(frame: CGRect(x: (self.keyWindow.frame.width - self.indicatorSize) / 2 * 1.7, y: (self.keyWindow.frame.height - self.indicatorSize) / 2 - 50, width: self.indicatorSize, height: self.indicatorSize))
        lable6.text = "6"
        lable6.textColor = UIColor.white
        containerView.addSubview(lable6)
        
        
    }
    
    func hide() {
        containerView.removeFromSuperview()
        indicatorView.removeFromSuperview()
        indicatorView2.removeFromSuperview()
        indicatorView3.removeFromSuperview()
        indicatorView4.removeFromSuperview()
        indicatorView5.removeFromSuperview()
        indicatorView6.removeFromSuperview()
    }
}












