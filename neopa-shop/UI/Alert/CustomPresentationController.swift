//
//  CustomPresentationController.swift
//  TAKAQ_iOS
//
//  Created by satsuki_shimada on 2017/10/11.
//  Copyright © 2017年 satsuki_shimada. All rights reserved.
//

import UIKit

/// アラート表示用のUIPresentationController
class CustomPresentationController: UIPresentationController {
    var overlayView = UIView()
    
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        
        // 黒い半透明の背景を配置する
        overlayView.frame = containerView.bounds
        overlayView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(CustomPresentationController.overlayViewDidTouch(_:)))]
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.0
        containerView.insertSubview(overlayView, at: 0)
        
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.overlayView.alpha = 0.5
        } , completion: nil)
    }
    
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] context in
            self?.overlayView.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    override func containerViewDidLayoutSubviews() {
        
    }
    
    @objc func overlayViewDidTouch(_ sender: Any) {
        
    }
}
