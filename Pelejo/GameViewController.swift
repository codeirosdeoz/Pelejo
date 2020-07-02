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
    var cactosDestroyed = 5
    var cut = false
    
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
        //print("knife")
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
        //print("end")
        sceneNode.stopFabiano()
    }
    
    @objc func swipeHandler(sender:UISwipeGestureRecognizer){
        //print("swipe")
        sceneNode.moveFabiano(swipe: sender)
    }
    

    @objc func tapHandler(sender:UITapGestureRecognizer){
        print("one tap")
        if sceneNode.allowJump == true{
            sceneNode.jumpFabiano()
            sceneNode.allowJump = false
            print("Saiu do chao")
        }
        
    }
    
    @IBAction func actionButton() {
        sceneNode.fabiano.animateKnifeAttack()
        print(self.cactosDestroyed)
        if(self.cut == true && self.cactosDestroyed > 0){
            sceneNode.destroyableCactus[self.cactosDestroyed-1].isHidden = true
            self.cactosDestroyed-=1
        }
        else{
            self.cut = false
        }
    }
    
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchLocation = touches.first!.location(in: sceneNode)
        var aux = false
        
        let touchedNode = sceneNode.nodes(at: touchLocation)
//        print("------ TOUCHED NODES:")
//        print(touchedNode)
        
        for i in touchedNode{
            if (i.name == "cacto") {
                aux = true
            }
        }

        if (aux) {
            sceneNode.fabiano.animateKnifeAttack()
            if(self.cactosDestroyed > 0){
                self.cactosDestroyed-=1
            }
            print(self.cactosDestroyed)
            print("touched cactos")

       }else{
           sceneNode.jumpFabiano()

       }



    }*/
    
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
