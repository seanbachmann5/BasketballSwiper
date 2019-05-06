//
//  GameScene.swift
//  BasketballSwiper
//
//  Created by SEAN BACHMANN on 5/2/19.
//  Copyright © 2019 CLC.Bachmann. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, UIGestureRecognizerDelegate {
   
    
    var holding:Timer!
    
    override func didMove(to view: SKView) {
    }
    
    @objc func runGame(){
    
    
    holding = Timer.scheduledTimer(timeInterval:0.7, target: self, selector:
        #selector(runGame), userInfo: nil, repeats:true)
}
    
    
    


   
    
    

}
