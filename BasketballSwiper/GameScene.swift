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
var dribbles = 0
var myScoreLabel:SKLabelNode!
var hit = 0

class GameScene: SKScene,SKPhysicsContactDelegate  {
    
    func dribblesCount() {
        hit += 1
        print("dribble count was called \(hit)")
        dribbles += 1
            if let myScoreLabel = self.childNode(withName: "Dribbles") as? SKLabelNode{
            myScoreLabel.text = "Dribbles  \(dribbles)"
        }
    }
   
    override func didMove(to view: SKView) {
        createBasketballHoop()
        print("basketball hoop spawned epic")
        physicsWorld.contactDelegate = self
       //self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        
        
        
        //player.anchorPoint = CGPoint(x: 0.5, y: 0.5)
       // player = SKSpriteNode(imageNamed: "Basketball")
    //layer.position = CGPoint(x: 0, y: 0)
       // player.scale(to: CGSize(width: 75, height: 75))
       // player.zPosition = 1
        //player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 2)
        //player.physicsBody?.contactTestBitMask = 2
        //player.physicsBody?.categoryBitMask = physicsCategory.player
        //player.physicsBody?.affectedByGravity = true
        //player.physicsBody?.mass = 0.1
        
        let player = "Basketball"
        
        class PlayerScene: SKScene {
            
            var player: SKSpriteNode?
            
            
            override func didMove(to view: SKView) {
                
                player = childNode(withName: "woodPlank") as? SKSpriteNode
                
                
                let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: Selector("swipedRight:"))
                
                swipeRight.direction = .right
                
                view.addGestureRecognizer(swipeRight)
                
            }
            
            
            func swipedRight(sender: UISwipeGestureRecognizer) {
                
                print("Object has been swiped")
                
            }
            
            
            func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
            {
                let touch = touches.first as! UITouch
                let location = touch.location(in: self)
                
                if (player?.frame.contains(location))!
                {
                    print("Swipe has started")
                }
            }
            
        }
        
    
    
    //override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  for touch in touches{
       // let location = touch.location(in: self)
       //     player.position.x = location.x
       //     player.position.y = location.y
      //  }
   // }
    
        func createBasketballHoop() {
            let basketballHoop = SKSpriteNode(imageNamed: "Basketball Hoop")
            //enemy.position = randomPoint()
           // basketballHoop.physicsBody = SKPhysicsBody(rectangleOf: basketballHoop.size)
            basketballHoop.physicsBody?.mass = 1
            basketballHoop.scale(to: CGSize(width: 705, height: 496))
            basketballHoop.position = CGPoint(x: 0, y: 1765)
            basketballHoop.physicsBody?.categoryBitMask = 2
            basketballHoop.physicsBody?.contactTestBitMask = 1
            basketballHoop.zPosition = 0
            //enemy.physicsBody?.collisionBitMask = PhysicsCategory.none
            addChild(basketballHoop)
            
            
         //   let actionMove = SKAction.pause()
              //  basketballHoop.run(SKAction.sequence([actionMove]))
           
        }
    
        func didBegin(_ contact: SKPhysicsContact) {
            print("Add Dribbles")
            dribblesCount()
        }
    }
}
