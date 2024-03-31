//
//  UIView Extension.swift
//  STARZPLAY
//
//  Created by umair on 31/03/2024.
//


import UIKit

extension UIView {
    enum GradientDirection {
        case topToBottom
        case bottomToTop
        case leftToRight
        case rightToLeft
    }

    func addGradient(colors: [UIColor], direction: GradientDirection) {
        // Create gradient layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map { $0.cgColor }
        
        // Calculate the start and end points based on the direction
        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .bottomToTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .rightToLeft:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        }
        
        // Set the frame of the gradient layer to match the view's bounds
        gradientLayer.frame = bounds
        
        // Insert the gradient layer at the bottom of the view's layer hierarchy
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
