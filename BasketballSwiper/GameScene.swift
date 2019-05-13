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

class GameScene: SKScene,SKPhysicsContactDelegate  {
    
    func scoreCount() {
        score += 2
        if let myScoreLabel = self.childNode(withName: "Score") as? SKLabelNode{
            myScoreLabel.text = "Score  \(score)"
        }
    }
   
    override func didMove(to view: SKView) {
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        createBasketballHoop()
        scoreCount()
        physicsWorld.contactDelegate = self
    self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player = SKSpriteNode(imageNamed: "Basketball")
        player.position = CGPoint(x: 0, y: 0)
        player.scale(to: CGSize(width: 75, height: 75))
        player.zPosition = 1
      
    //trying to commit
        

        
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        player.physicsBody?.contactTestBitMask = physicsCategory.basketballHoop
        player.physicsBody?.categoryBitMask = physicsCategory.player
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.mass = 0.1
self.addChild(player)
   
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
        let location = touch.location(in: self)
            player.position.x = location.x
            player.position.y = location.y
        }
            
        }
        func createBasketballHoop() {
            let basketballHoop = SKSpriteNode(imageNamed: "Basketball Hoop")
            //enemy.position = randomPoint()
           // basketballHoop.physicsBody = SKPhysicsBody(rectangleOf: basketballHoop.size)
            basketballHoop.physicsBody?.mass = 1
            basketballHoop.scale(to: CGSize(width: 653, height: 496))
            basketballHoop.position = CGPoint(x: -0, y: 419)
            basketballHoop.physicsBody?.categoryBitMask = physicsCategory.basketballHoop
            basketballHoop.physicsBody?.contactTestBitMask = physicsCategory.player
            basketballHoop.zPosition = -1
            //enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            addChild(basketballHoop)
            
            let actionMove = SKAction.pause()
                basketballHoop.run(SKAction.sequence([actionMove]))
         

    

}
    
        func didBegin(_ contact: SKPhysicsContact) {
            print("Add Score")
            let one = contact.bodyA.node as? SKSpriteNode
            let two = contact.bodyB.node as? SKSpriteNode
            //one?.removeFromParent()
            //two?.removeFromParent()
       
        }
    

   
 
    




}

