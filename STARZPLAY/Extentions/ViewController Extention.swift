//
//  ViewControllerExtention.swift
//  STARZPLAY
//
//  Created by umair on 31/03/2024.
//
import UIKit

extension UIViewController {
    
    func add(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        childViewController.didMove(toParent: self)
    }
}
