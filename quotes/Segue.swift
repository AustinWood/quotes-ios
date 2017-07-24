//
//  Transition.swift
//  quotes
//
//  Created by Austin Wood on 7/23/17.
//  Copyright © 2017 Austin Wood. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    let duration: TimeInterval = 0.25
    let delay: TimeInterval = 0
    let animationOptions: UIViewAnimationOptions = [.curveEaseOut] // [.CurveEaseInOut]
    
    override func perform() {
        let sourceView = source.view
        let destinationView = destination.view
        
        // let screenHeight = UIScreen.main.bounds.size.height
        let screenWidth = UIScreen.main.bounds.size.width
        destinationView?.transform = CGAffineTransform(translationX: screenWidth, y: 0)
        
        // add destination view to view hierarchy
        UIApplication.shared.keyWindow?.insertSubview(destinationView!, aboveSubview: sourceView!)
        
        UIView.animate(withDuration: duration, delay: delay, options: animationOptions, animations: {
            destinationView?.transform = .identity
        }) { (_) in
            self.source.present(self.destination, animated: false, completion: nil)
        }
    }
}
