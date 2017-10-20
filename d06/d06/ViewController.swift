//
//  ViewController.swift
//  d06
//
//  Created by Vladyslav Tymchenko on 12.10.17.
//  Copyright © 2017 Vladyslav Tymchenko. All rights reserved.
//

import UIKit
import CoreMotion

fileprivate let WIDTH: CGFloat = 100
fileprivate let HEIGTH: CGFloat = 100

class ViewController: UIViewController {
    
    var dynamicAnimator: UIDynamicAnimator?

    let gravityBehavior = UIGravityBehavior()
    
    let collisionBehavior = UICollisionBehavior()
    
    let dynamicBehavior = UIDynamicItemBehavior()
    
    let coreMotionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        
        gravityBehavior.magnitude = 1
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        dynamicBehavior.elasticity = 0.5
        
        dynamicAnimator?.addBehavior(gravityBehavior)
        dynamicAnimator?.addBehavior(collisionBehavior)
        dynamicAnimator?.addBehavior(dynamicBehavior)
        
        coreMotionManager.accelerometerUpdateInterval = 0.1
        coreMotionManager.startAccelerometerUpdates(to: OperationQueue.main) { motion, error in
            self.gravityBehavior.gravityDirection = CGVector(dx: (motion?.acceleration.x)!, dy: -(motion?.acceleration.y)!)
        }
    }

    @IBAction func tapHandler(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        let myView = MyView(frame: CGRect(x: location.x - WIDTH / 2, y: location.y - HEIGTH / 2, width: WIDTH, height: HEIGTH))
        myView.backgroundColor = UIColor.clear
        view.addSubview(myView)
        addItemToBehaviors(myView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.dragView(_:)))
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinchView(_:)))
        let rotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(ViewController.rotateView(_:)))
        myView.isUserInteractionEnabled = true
        myView.addGestureRecognizer(panGestureRecognizer)
        myView.addGestureRecognizer(pinchGestureRecognizer)
        myView.addGestureRecognizer(rotationGestureRecognizer)
    }
    
    @objc func dragView(_ sender: UIPanGestureRecognizer) {
        removeItemFromBehavior(sender.view!)
        let translation = sender.translation(in: self.view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + translation.x, y: (sender.view?.center.y)! + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        addItemToBehaviors(sender.view!)
    }
    
    @objc func pinchView(_ sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .began:
            removeItemFromBehavior(sender.view!)
        case .changed:
            let newWidth = (sender.view?.bounds.size.width)! * sender.scale
            let newHeight = (sender.view?.bounds.size.height)! * sender.scale
            if newWidth < self.view.bounds.width && newHeight < self.view.bounds.height  && newWidth > 25 && newHeight > 25 {
                sender.view?.bounds.size.width *= sender.scale
                sender.view?.bounds.size.height *= sender.scale
            }
        case .ended:
            addItemToBehaviors(sender.view!)
        default:
            break
        }
    }
    
    @objc func rotateView(_ sender: UIRotationGestureRecognizer) {
        switch sender.state {
        case .began:
            removeItemFromBehavior(sender.view!)
        case .changed:
            sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
        case .ended:
            addItemToBehaviors(sender.view!)
        default:
            break
        }
    }
    
    fileprivate func addItemToBehaviors(_ view: UIView) {
        gravityBehavior.addItem(view)
        collisionBehavior.addItem(view)
        dynamicBehavior.addItem(view)
    }
    
    fileprivate func removeItemFromBehavior(_ view: UIView) {
        gravityBehavior.removeItem(view)
        collisionBehavior.removeItem(view)
        dynamicBehavior.removeItem(view)
    }
}

