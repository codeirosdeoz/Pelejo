//
//  GameViewController.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var sceneNode = GameScene()
    var firstTouch = UITouch()

    var collectedBranches = 0
    var textNumberBranches = UITextView(frame: CGRect(x: 10, y: 0, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        rightSwipe.cancelsTouchesInView = false
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        leftSwipe.cancelsTouchesInView = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(tap)
        
        textNumberBranches.text = "Colected branches: " + String(collectedBranches)
        textNumberBranches.backgroundColor = nil
        view.addSubview(textNumberBranches)

        
        if let view = self.view as! SKView? {
            let scene = SKScene(fileNamed: "GameScene")!
            sceneNode = scene as! GameScene
            sceneNode.scaleMode = .aspectFill
            view.presentScene(sceneNode)
            view.ignoresSiblingOrder = false
            //view.showsPhysics = true
            
            sceneNode.gameViewController = self
        }
        
    }
    
    func restart(){
        
        if let view = self.view as! SKView? {
            let scene = SKScene(fileNamed: "GameScene")!
            sceneNode = scene as! GameScene
            sceneNode.scaleMode = .aspectFill
            view.presentScene(sceneNode)
            view.ignoresSiblingOrder = false
            //view.showsPhysics = true
            
            sceneNode.gameViewController = self
        }
    }
    
    @IBAction func knifebutton() {
        print("knife")
        let spriteNode = sceneNode.fabiano.elementBody as! SKSpriteNode
        
        if (sceneNode.fabiano.isHoldingKnife){
            spriteNode.texture = SKTexture(imageNamed: "WalkFabFront/0")
            sceneNode.fabiano.elementBody.xScale = sceneNode.fabiano.elementBody.xScale / 1.4
            sceneNode.fabiano.isHoldingKnife = false
        }else{
            spriteNode.texture = SKTexture(imageNamed: "WalkFabKnife/0")
            sceneNode.fabiano.elementBody.xScale = sceneNode.fabiano.elementBody.xScale * 1.4
            sceneNode.fabiano.isHoldingKnife = true

        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("end")
        sceneNode.stopFabiano()
    }
    
    @objc func swipeHandler(sender:UISwipeGestureRecognizer){
        print("swipe")
        sceneNode.moveFabiano(swipe: sender)
    }
    
    @objc func tapHandler(sender:UITapGestureRecognizer){
        
        sceneNode.jumpFabiano()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
