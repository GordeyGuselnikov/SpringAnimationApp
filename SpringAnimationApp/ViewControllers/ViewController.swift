//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Guselnikov Gordey on 6/15/23.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationLabel: SpringLabel! {
        didSet {
            animationLabel.text = animation.description
        }
    }
    
    // MARK: - Private properties
    private var animation = Animation.getRandomAnimation()

    // MARK: - IB Actions
    @IBAction func animationButtonPressed(_ sender: UIButton) {
        animationLabel.animation = "zoomOut"
        animationLabel.x = 50
        animationLabel.animate()
        animationLabel.text = animation.description
        
        animationLabel.animateNext { [unowned self] in
            animationLabel.animation = "zoomIn"
            animationLabel.animate()
            
            animationView.animation = animation.name
            animationView.curve = animation.curve
            animationView.duration = animation.duration
            animationView.force = animation.force
            animationView.delay = animation.delay
            animationView.animate()
            
            animation = Animation.getRandomAnimation()
            sender.setTitle("Run \(animation.name)", for: .normal)
        }
    }
}
