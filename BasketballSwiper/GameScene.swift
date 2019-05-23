//
//  GameScene.swift
//  BasketballSwiper
//
//  Created by SEAN BACHMANN on 5/2/19.
//  Copyright © 2019 CLC.Bachmann. All rights reserved.
//

import SpriteKit
import GameplayKit
struct physicsCategory {
        static let player: UInt32 = 1
        static let basketballHoop: UInt32 = 2

}

var player = SKSpriteNode()
var basketballHoop = SKSpriteNode()

var score = 0
var myScoreLabel:SKLabelNode!
var hit = 0

class GameScene: SKScene,SKPhysicsContactDelegate  {
  
// score count function
    func scoreCount() {
        score += 1
        if let myScoreLabel = self.childNode(withName: "Score") as? SKLabelNode{
            myScoreLabel.text = "Score  \(score)"
        }
    }
    
    func moveBall (moveBy: CGFloat, forTheKey: String) {
        let moveAction = SKAction.moveBy(x: moveBy, y: 0, duration: 1)
        let repeatForEver = SKAction.repeatForever(moveAction)
        let seq = SKAction.sequence([moveAction, repeatForEver])
        
        //run the action on your ship
        player.run(seq, withKey: forTheKey)
    }

    
    
    
    
    
    
    
    
   
    override func didMove(to view: SKView) {
        createBasketballHoop()
        createPlayer()
        print("basketball hoop spawned epic")
        physicsWorld.contactDelegate = self
       //self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        
        
        
        //player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
        let location = touch.location(in: self)
            player.position.x = location.x
           player.position.y = location.y
        }
    }
     func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
     player.removeFromParent()
    }
    
        func createPlayer(){
            player = SKSpriteNode(imageNamed: "Basketball")
            player.position = CGPoint(x: 0, y: 1200)
            player.scale(to: CGSize(width: 75, height: 75))
            player.zPosition = 1
            player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
            player.physicsBody?.contactTestBitMask = 2
            player.physicsBody?.categoryBitMask = 1
            player.physicsBody?.affectedByGravity = true
            player.physicsBody?.mass = 0.1
        self.addChild(player)
    }
    
    
    
            func createBasketballHoop() {
                basketballHoop = SKSpriteNode(imageNamed: "Basketball Hoop")
                    //enemy.position = randomPoint()
                basketballHoop.physicsBody = SKPhysicsBody(rectangleOf: basketballHoop.size)
                basketballHoop.physicsBody?.mass = 1
                basketballHoop.scale(to: CGSize(width: 705, height: 496))
                basketballHoop.position = CGPoint(x: 0, y: 1765)
                basketballHoop.physicsBody?.categoryBitMask = 2
                basketballHoop.physicsBody?.contactTestBitMask = 1
                basketballHoop.zPosition = -1
                basketballHoop.physicsBody?.affectedByGravity = false
                basketballHoop.physicsBody?.pinned = true
                basketballHoop.physicsBody?.allowsRotation = false
                basketballHoop.physicsBody?.isDynamic = false
                    //enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            addChild(basketballHoop)
            
            
                    //   let actionMove = SKAction.pause()
                        //  basketballHoop.run(SKAction.sequence([actionMove]))
           
        }
    
                func didBegin(_ contact: SKPhysicsContact) {
                        print("Add Dribbles")
                   
                    scoreCount()
                    }
                    
                   
           
            
            

}
