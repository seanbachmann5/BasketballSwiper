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

class GameScene: SKScene,SKPhysicsContactDelegate  {
override func didMove(to view: SKView) {
    physicsWorld.contactDelegate = self

    self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player = SKSpriteNode(imageNamed: "Basketball")
 player.position = CGPoint(x: 0, y: 0)
  player.scale(to: CGSize(width: 75, height: 75))
  player.zPosition = 1
    //trying to commit
    let border = SKPhysicsBody(edgeLoopFrom: self.frame)
    self.physicsBody = border
  basketballHoop.physicsBody?.contactTestBitMask = physicsCategory.basketballHoop
    player.physicsBody?.categoryBitMask = physicsCategory.player
    player.physicsBody?.affectedByGravity = true
    self.addChild(player)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
        let location = touch.location(in: self)
            player.position.x = location.x
            player.position.y = location.y
    }
        func createBasketballHoop() {
            let basketballHoop = SKSpriteNode(imageNamed: "Basketball Hoop")
            //enemy.position = randomPoint()
           // basketballHoop.physicsBody = SKPhysicsBody(rectangleOf: basketballHoop.size)
           basketballHoop.physicsBody?.mass = 1
            basketballHoop.scale(to: CGSize(width: 50, height: 50))
           basketballHoop.physicsBody?.categoryBitMask = physicsCategory.basketballHoop
            basketballHoop.physicsBody?.contactTestBitMask = physicsCategory.player
            //enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            basketballHoop.physicsBody?.isDynamic = true
            addChild(basketballHoop)
            
            let actionMove = SKAction.move(to: CGPoint(x: 0, y: 300), duration: TimeInterval(CGFloat.random(in: 2.0...4.0)))
            let actionMoveDone = SKAction.removeFromParent()
           basketballHoop.run(SKAction.sequence([actionMove,actionMoveDone]))
         

    
    
}
    
        func didBegin(_ contact: SKPhysicsContact) {
            print("contact")
            let one = contact.bodyA.node as? SKSpriteNode
            let two = contact.bodyB.node as? SKSpriteNode
            one?.removeFromParent()
            two?.removeFromParent()
       
        }


   
    
    




}
}
