//
//  TutorialViewController.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class TutorialViewController: UIViewController {
    
    var sceneNode = TutorialScene()
    var firstTouch = UITouch()

    var cut = false
    
    @IBOutlet weak var knifeCutButton: UIButton!
    
    @IBOutlet weak var missionView: UIView!
    @IBOutlet weak var actionKnifeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        rightSwipe.cancelsTouchesInView = false
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        leftSwipe.cancelsTouchesInView = false
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        
//        textNumberBranches.text = "Colected branches: " + String(collectedBranches)
//        textNumberBranches.backgroundColor = nil
//        view.addSubview(textNumberBranches)

        
        if let view = self.view as! SKView? {
            let scene = SKScene(fileNamed: "TutorialScene")!
            sceneNode = scene as! TutorialScene
            sceneNode.scaleMode = .aspectFill
            view.presentScene(sceneNode)
            view.ignoresSiblingOrder = false
            //view.showsPhysics = true
            
        }
        
    }
    
    func restart(){
        
        if let view = self.view as! SKView? {
            let scene = SKScene(fileNamed: "TutorialScene")!
            sceneNode = scene as! TutorialScene
            sceneNode.scaleMode = .aspectFill
            view.presentScene(sceneNode)
            view.ignoresSiblingOrder = false
            //view.showsPhysics = true
            
        }
    }

    @IBAction func knifebutton() {
        //print("knife")
        let spriteNode = sceneNode.fabiano.elementBody as! SKSpriteNode
        
        if (sceneNode.fabiano.isHoldingKnife){
            knifeCutButton.isHidden = true
            spriteNode.texture = SKTexture(imageNamed: "WalkFabFront/0")
            sceneNode.fabiano.elementBody.xScale = sceneNode.fabiano.elementBody.xScale / 1.4
            sceneNode.fabiano.isHoldingKnife = false
        }else{
            knifeCutButton.isHidden = false
            spriteNode.texture = SKTexture(imageNamed: "WalkFabKnife/0")
            sceneNode.fabiano.elementBody.xScale = sceneNode.fabiano.elementBody.xScale * 1.4
            sceneNode.fabiano.isHoldingKnife = true

        }
        
    }
    
    @objc func swipeHandler(sender:UISwipeGestureRecognizer){
        //print("swipe")
        sceneNode.moveFabiano(swipe: sender)
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
