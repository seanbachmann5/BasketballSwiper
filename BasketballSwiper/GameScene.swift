//
//  GameScene.swift
//  BasketballSwiper
//
//  Created by SEAN BACHMANN on 5/2/19.
//  Copyright © 2019 CLC.Bachmann. All rights reserved.
//

import SpriteKit
import GameplayKit
var player = SKSpriteNode()


class GameScene: SKScene {
override func didMove(to view: SKView) {
    
    
    self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        //hi
        player = SKSpriteNode(imageNamed: "Basketball")
 player.position = CGPoint(x: 0, y: 0)
  player.scale(to: CGSize(width: 75, height: 75))
  //trying to commit
    let border = SKPhysicsBody(edgeLoopFrom: self.frame)
    self.physicsBody = border
    self.addChild(player)
    player.physicsBody?.affectedByGravity = true
    
    }
    
 
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
        let location = touch.location(in: self)
            player.position.x = location.x
            player.position.y = location.y
            
        
    }
    
    
    
}
    
    
    


   
    
    


}
