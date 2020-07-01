//
//  BirdClass.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 30/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import SpriteKit
import GameKit


public class BirdClass{
    
    var birdNode: SKNode
    var direction = true
    var aux = false
    var flyInterval:TimeInterval = 0.7
    var xMovimentVariation:CGFloat = 300
    var numberOfTextures = 5
    var flyAnimationTextures : [SKTexture] = []
    
    
    init(node:SKNode) {
        birdNode = node
        loadTextures()
        
        
    }
    
    func movementManagement(){
        
        if(direction && birdNode.action(forKey: "Right") == nil){
            
            direction = false
            flyLeft()
            
        }else if(!direction && birdNode.action(forKey: "Left") == nil){
            //birdNode.xScale = birdNode.xScale * -1
            direction = true
            flyRight()
        }
    }
    
    
    func loadTextures(){
        for i in 0..<numberOfTextures{
            print(i)
            print(SKTexture(imageNamed:"BirdFlying/\(i)"))
            flyAnimationTextures.append(SKTexture(imageNamed:"BirdFlying/\(i)" ))
        }
        
        
        flyAnimationTextures.append(SKTexture(imageNamed:"BirdFlying/\(4)" ))
        flyAnimationTextures.append(SKTexture(imageNamed:"BirdFlying/\(3)" ))
        flyAnimationTextures.append(SKTexture(imageNamed:"BirdFlying/\(2)" ))
        flyAnimationTextures.append(SKTexture(imageNamed:"BirdFlying/\(1)" ))

    
    }
    
    func flyRight(){
        if(!aux){
            birdNode.xScale = birdNode.xScale * -1
            aux = true
        }
        birdNode.run(SKAction.move(by: CGVector(dx: xMovimentVariation, dy: 0), duration: flyInterval), withKey: "Right")
    }
    
    func flyLeft(){
        
        if(aux){
            birdNode.xScale = birdNode.xScale * -1
            aux = false
        }
        
        birdNode.run(SKAction.move(by: CGVector(dx: -xMovimentVariation, dy: 0), duration: flyInterval), withKey: "Left")
    }
    
    func animateFly(){
     
        birdNode.run(SKAction.repeatForever(SKAction.animate(with: flyAnimationTextures, timePerFrame: 0.07)),withKey: "Flying")
    }
    

}
