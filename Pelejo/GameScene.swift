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
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
    }
    
    override func didMove(to view: SKView) {
        fabiano.elementBody = self.childNode(withName: "Fabiano")!
    }
    
    func moveFabiano(swipe:UISwipeGestureRecognizer){
        if swipe.direction == .left{
            fabiano.moveElementLeft()
        }else if swipe.direction == .right{
            fabiano.moveElementRight()
        }
    }
    
    func jumpFabiano(){
        fabiano.jumpMoviment()
    }
}

