//
//  UIViewController+Ext.swift
//  BookstoreApp
//
//  Created by Huy Ong on 1/12/20.
//  Copyright © 2020 Huy Ong. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicatorView: UIActivityIndicatorView = {
            let aiv = UIActivityIndicatorView(style: .large)
            aiv.color = .black
            aiv.hidesWhenStopped = true
            return aiv
        }()
        
        containerView.addSubview(activityIndicatorView)
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.fillSuperview()
        activityIndicatorView.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
}
