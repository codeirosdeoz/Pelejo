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
    public var animationTextures:[SKTexture] = []
    private let movimentHandler = MovimentClass()
    
    func moveElementRight(){
        movimentHandler.moveRight(body: elementBody)
    }
    
    func moveElementLeft(){
        movimentHandler.moveLeft(body:elementBody)
    }
    
    func jumpMoviment(){
        movimentHandler.jumpMoviment(body: elementBody)
    }
    
    func stopMoviment(movimentKey:String){
        movimentHandler.stopMovimentForKey(body: elementBody, movimentKey: movimentKey)
    }
    
    func loadTextureArray(folderName:String, numberOfTextures:Int){
        
        for i in 0..<numberOfTextures{
            animationTextures.append(SKTexture(imageNamed: folderName + String(i)))
        }
    }
    
    func animamteWalk(){
        
    }
}

