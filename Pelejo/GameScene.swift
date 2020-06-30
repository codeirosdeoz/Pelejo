//
//  GameScene.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var fabiano = CharachterSceneElement()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var aux = true
    
    let cameraNode = SKCameraNode()
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
        cameraNode.position = CGPoint(x: fabiano.elementBody.position.x,y: fabiano.elementBody.position.y)
        //adding camera to scene
        addChild(cameraNode)
        self.camera = cameraNode
        
    }
    
    override func didMove(to view: SKView) {
        
        
        fabiano.elementBody = self.childNode(withName: "Fabiano")!
        fabiano.loadFrontWalkTextureArray(folderName: "WalkFabFront", numberOfTextures: 6)
        fabiano.loadBackWalkTextureArray(folderName: "WalkFabBack", numberOfTextures: 6)
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
    
    func stopFabiano(){
        if fabiano.rightMoviment == true{
            fabiano.stopAnimate(key: "Right")
        }else{
            fabiano.stopAnimate(key: "Left")
        }
    }
    
    func jumpFabiano(){
        fabiano.jumpMoviment()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        let xPos = clamping(num:fabiano.elementBody.position.x , min: 0, max: 5825)
        
        cameraNode.position = CGPoint(x: xPos , y: 0.0)
       
    }
    
    
    func clamping(num: CGFloat, min: CGFloat, max: CGFloat) -> CGFloat{
        
        var result = num
        if(num>max){
            result = max
        }else{
            if(result<min){
                result = min
            }
        }
        
        return result
    }

}


