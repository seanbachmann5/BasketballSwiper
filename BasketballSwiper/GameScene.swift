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
    
    func scoreCount() {
        hit += 1
        print("score count was called \(hit)")
        score += 1
            if let myScoreLabel = self.childNode(withName: "Score") as? SKLabelNode{
            myScoreLabel.text = "Score  \(score)"
        }
    }
   
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.physicsBody = border
        
        createBasketballHoop()
        
        player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        player = SKSpriteNode(imageNamed: "Basketball")
        player.position = CGPoint(x: 0, y: 0)
        player.scale(to: CGSize(width: 75, height: 75))
        player.zPosition = 1
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        player.physicsBody?.contactTestBitMask = 2
        player.physicsBody?.categoryBitMask = 1
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
            basketballHoop.physicsBody?.categoryBitMask = 2
            basketballHoop.zPosition = -1
            //enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            addChild(basketballHoop)
            
            let actionMove = SKAction.pause()
                basketballHoop.run(SKAction.sequence([actionMove]))
        }
    
        func didBegin(_ contact: SKPhysicsContact) {
            print("Add Score")
            scoreCount()
        }
    }
