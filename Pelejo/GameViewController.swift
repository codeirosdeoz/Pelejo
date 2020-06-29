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
    
    //var scene = GKScene()
    var sceneNode = GameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        rightSwipe.direction = .right
        leftSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(tap)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
        
        //scene = GKScene(fileNamed: "GameScene")!
        // Get the SKScene from the loaded GKScene
        //sceneNode = (scene.rootNode as! GameScene?)!
        // Copy gameplay related content over to the scene
        //sceneNode.entities = scene.entities
        //sceneNode.graphs = scene.graphs
        // Set the scale mode to scale to fit the window
        //sceneNode.scaleMode = .aspectFill
        
        // Present the scene
        //if let view = self.view as! SKView? {
            //view.presentScene(sceneNode)
            //view.ignoresSiblingOrder = false
            //view.showsFPS = true
            //view.showsNodeCount = true
        //}
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("cancel")
    }
    
    @objc func swipeHandler(sender:UISwipeGestureRecognizer){
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
