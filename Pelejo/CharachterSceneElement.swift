//
//  CharachterSceneElement.swift
//  Pelejo
//
//  Created by Luis Pereira on 26/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import SpriteKit

class CharachterSceneElement{
    public var elementBody:SKNode = SKNode()
    var animationFrontWalkTextures:[SKTexture] = []
    var animationBackWalkTextures:[SKTexture] = []
    var leftMoviment = false
    var rightMoviment = false
    private let movimentHandler = MovimentClass()
    
    func moveElementRight(){
        movimentHandler.moveRight(body: elementBody)
        rightMoviment = true
    }
    
    func moveElementLeft(){
        movimentHandler.moveLeft(body:elementBody)
        leftMoviment = true
    }
    
    func jumpMoviment(){
        movimentHandler.jumpMoviment(body: elementBody)
    }
    
    func stopMoviment(movimentKey:String){
        movimentHandler.stopMovimentForKey(body: elementBody, movimentKey: movimentKey)
    }
    
    func loadFrontWalkTextureArray(folderName:String, numberOfTextures:Int){
        
        for i in 0..<numberOfTextures{
            animationFrontWalkTextures.append(SKTexture(imageNamed:"WalkFabFront/\(i)" ))
        }
    }
    
    func loadBackWalkTextureArray(folderName:String, numberOfTextures:Int){
        
        for i in 0..<numberOfTextures{
            animationBackWalkTextures.append(SKTexture(imageNamed:"WalkFabBack/\(i)" ))
        }
    }
    
    func animamteFrontWalk(){
        elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationFrontWalkTextures, timePerFrame: 0.1)),withKey: "Animate Right")
        
    }
    
    func animamteBackWalk(){
        elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationBackWalkTextures, timePerFrame: 0.1)),withKey: "Animate Left")
    }
    
    func stopAnimate(key:String){
        if key == "Right"{
            elementBody.removeAction(forKey: "Animate Right")
            stopMoviment(movimentKey: "Right")
            rightMoviment = false
        }else{
            elementBody.removeAction(forKey: "Animate Left")
            stopMoviment(movimentKey: "Left")
            leftMoviment = false
        }
    }
}

