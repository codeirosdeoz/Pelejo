//
//  ChapterStoryViewController.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import Foundation
import UIKit

class ChapterStoryViewController: UIViewController {
    
   // var chapter: int
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var chapterImage: UIImageView!
    @IBOutlet weak var chapterNumber: UILabel!
    @IBOutlet weak var chapterTitle: UILabel!
    @IBOutlet weak var cordelOverlay: UIImageView!
    @IBOutlet weak var cordelText: UILabel!
    @IBOutlet weak var gameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.centerXAnchor.constraint(equalTo:
            self.view.centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo:
            self.view.centerYAnchor).isActive = true
        
        cordelText.translatesAutoresizingMaskIntoConstraints = false
        cordelText.centerXAnchor.constraint(equalTo: cordelOverlay.centerXAnchor, constant: cordelOverlay.bounds.width / 30).isActive = true
        cordelText.topAnchor.constraint(equalTo: cordelOverlay.topAnchor, constant: view.bounds.height / 10).isActive = true
    }
}
