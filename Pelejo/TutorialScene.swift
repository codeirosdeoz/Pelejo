//
//  Tutorial.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 01/07/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//


import SpriteKit
import GameplayKit

class TutorialScene: SKScene {
    
    var messages: [String] = []
    var conditions: [CGFloat] = []
    var fabiano = CharachterSceneElement()
    private var aux = true
    
    
    
    
    
    
    func update(){
        
        for i in 0...messages.count{
            if(fabiano.elementBody.position.x >= conditions[i]){
                
            }
        }
    }
        
        
    func moveFabiano(swipe:UISwipeGestureRecognizer){

        
        if swipe.direction == .left{
            
            if(aux){
                //fabiano.elementBody.yScale = fabiano.elementBody.yScale  * -1
                
                fabiano.elementBody.xScale = fabiano.elementBody.xScale  * -1
            }
            aux = false
            
            fabiano.animamteBackWalk()
            //EU ACHO QUE A ANIMACAO EM QUE COMECAR UM POUCO ANTES DO MOVIMENTO EM SI, MEXA NESSE 0.1 PRA AJUSTAR ISSO (A GENTE PRIMEIRO LEVANTA A PERTA DE DPS SE DESLOCA)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {self.fabiano.moveElementLeft()})
            
            
        }else if swipe.direction == .right{
            if(!aux){
                //fabiano.elementBody.yScale = fabiano.elementBody.yScale  * -1
                fabiano.elementBody.xScale = fabiano.elementBody.xScale  * -1
            }
            
            aux = true
        
            fabiano.animamteFrontWalk()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1, execute: {self.fabiano.moveElementRight()})
        }
        
    }
        
        
        
}
