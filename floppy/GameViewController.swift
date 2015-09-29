//
//  ViewController.swift
//  floppy
//
//  Created by Harley Trung on 9/29/15.
//  Copyright © 2015 cheetah. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var birdView: UIImageView!
    
    var animator = UIDynamicAnimator()
    var gravity = UIGravityBehavior()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg")?.drawInRect(self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        animator.addBehavior(gravity)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onStart(sender: UIButton) {
        
        gravity.addItem(birdView)
        
        
        let topPipe = UIImageView(image: UIImage(named: "pipeTop"))
        topPipe.frame = CGRect(x: 280, y: 0, width: 40, height: 200)
        
        let bottomPipeHeight = 100
        let bottomPipe = UIImageView(image: UIImage(named: "pipeBottom"))
        bottomPipe.frame = CGRect(x: 280, y: Int(view.frame.height) - bottomPipeHeight, width: 40, height: bottomPipeHeight)
        
        view.addSubview(topPipe)
        view.addSubview(bottomPipe)
        
        let pipeProperties = UIDynamicItemBehavior(items: [topPipe, bottomPipe])
        pipeProperties.addLinearVelocity(CGPoint(x: -50, y: 0), forItem: topPipe)
        pipeProperties.addLinearVelocity(CGPoint(x: -50, y: 0), forItem: bottomPipe)
        
        animator.addBehavior(pipeProperties)
    }
    
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        let birdItemBehavior = UIDynamicItemBehavior(items: [birdView])
        animator.addBehavior(birdItemBehavior)
        
        let initialVelocity = birdItemBehavior.linearVelocityForItem(birdView)
        print(initialVelocity)
        
        let push = UIPushBehavior(items: [birdView], mode: UIPushBehaviorMode.Instantaneous)
        
        push.pushDirection = CGVectorMake(0, -3)
        push.active = true
        animator.addBehavior(push)
        
        
    }
    
    
    
    
    
    
    
}