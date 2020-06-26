//
//  MovimentClass.swift
//  Pelejo
//
//  Created by Luis Pereira on 26/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import SpriteKit

class MovimentClass{
    
    public var xMovimentVariation:CGFloat = 150
    public var yJumpVariation:CGFloat = 400
    public var interval:TimeInterval = 0.5
    
    func moveLeft(body:SKNode){
        body.run(SKAction.move(by: CGVector(dx: -xMovimentVariation, dy: 0), duration: interval), withKey: "Left")
    }
    
    func moveRight(body:SKNode){
        body.run(SKAction.move(by: CGVector(dx: xMovimentVariation, dy: 0), duration: interval), withKey: "Right")
    }
    
    func stopMovimentForKey(body:SKNode, movimentKey:String){
        body.removeAction(forKey: movimentKey)
    }
    
    func jumpMoviment(body:SKNode){
        body.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: yJumpVariation))
    }
}
