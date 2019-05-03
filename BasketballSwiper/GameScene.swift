//
//  GameScene.swift
//  BasketballSwiper
//
//  Created by SEAN BACHMANN on 5/2/19.
//  Copyright © 2019 CLC.Bachmann. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var holding:Timer!
    
    
    
    override func didMove(to view: SKView) {
        
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view?.addGestureRecognizer(swipeRight)
        
        var swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.view?.addGestureRecognizer(swipeDown)
        
        
    }
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
            case UISwipeGestureRecognizer.Direction.down:
                print("Swiped down")
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
            case UISwipeGestureRecognizer.Direction.up:
                print("Swiped up")
            default:
                break
                
            }
        }
    }
    @objc func runGame(){
    
    
    holding = Timer.scheduledTimer(timeInterval:0.7, target: self, selector:
        #selector(runGame), userInfo: nil, repeats:true)
}
    
    
    
}

   
    
    

