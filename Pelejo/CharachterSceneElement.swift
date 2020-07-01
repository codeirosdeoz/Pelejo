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
    var animationWalkKnifeTextures: [SKTexture] = []
    var animationKnifeAttackTextures: [SKTexture] = []
    var leftMoviment = false
    var rightMoviment = false
    var isJumping = false
    var isHoldingKnife = false
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
    
    func loadKnifeWalkTextureArray(numberOfTextures: Int){
        for i in 0..<numberOfTextures{
             animationWalkKnifeTextures.append(SKTexture(imageNamed:"WalkFabKnife/\(i)" ))
         }
    }
    
    func loadKnifeAttackTextureArray(numberOfTextures: Int){
        for i in 0..<numberOfTextures{
             animationKnifeAttackTextures.append(SKTexture(imageNamed:"FabKnifeAttack/\(i)" ))
         }
    }
    
    func animamteFrontWalk(){
        //BULA EM timerPerFrame PROS FRAMES PASSAREM MAIS RÁPIDOS, EU SÓ DIGO O ÓBVIO MESMO, SOU LINDO
        
        if(isHoldingKnife){
            elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationWalkKnifeTextures, timePerFrame: 0.1)),withKey: "Animate Right")

        }else{
            elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationFrontWalkTextures, timePerFrame: 0.1)),withKey: "Animate Right")

        }
        
    }
    
    func animateKnifeAttack(){
        if(isHoldingKnife){
            elementBody.run(SKAction.animate(with: animationKnifeAttackTextures, timePerFrame: 0.03))
            elementBody.run(SKAction.animate(with: animationKnifeAttackTextures, timePerFrame: 0.03))
            elementBody.run(SKAction.animate(with: animationKnifeAttackTextures, timePerFrame: 0.03))

        }
    }
    
    func animamteBackWalk(){
        //AQUI TAMBÉM, O MESMO DO DE CIMA
        
        if(isHoldingKnife){
            elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationWalkKnifeTextures, timePerFrame: 0.1)),withKey: "Animate Left")

        }else{
            elementBody.run(SKAction.repeatForever(SKAction.animate(with: animationFrontWalkTextures, timePerFrame: 0.1)),withKey: "Animate Left")

        }
    }
    
    func stopAnimate(key:String){
        if key == "Right"{
            elementBody.removeAction(forKey: "Animate Right")
            stopMoviment(movimentKey: "Right")
            rightMoviment = false
            //elementBody.run(SKAction.setTexture(animationFrontWalkTextures[0]))
        }else{
            elementBody.removeAction(forKey: "Animate Left")
            stopMoviment(movimentKey: "Left")
            leftMoviment = false
            //elementBody.run(SKAction.setTexture(animationFrontWalkTextures[0]))
        }
        
        if(isHoldingKnife){
            elementBody.run(SKAction.setTexture(animationWalkKnifeTextures[0]))

        }else{
            elementBody.run(SKAction.setTexture(animationFrontWalkTextures[0]))

        }
    }

}
