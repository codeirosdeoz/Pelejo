//
//  InitialPage.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//
import UIKit
import Foundation

class InitialPageViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameLogo: UILabel!
    @IBOutlet weak var sunIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.centerXAnchor.constraint(equalTo:
            self.view.centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo:
            self.view.centerYAnchor).isActive = true
        
        gameLogo.translatesAutoresizingMaskIntoConstraints = false
        gameLogo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        gameLogo.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 3).isActive = true

        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        playButton.centerYAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 3 * 2).isActive = true
        
    }

}

