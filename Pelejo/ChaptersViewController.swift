//
//  ChaptersViewController.swift
//  Pelejo
//
//  Created by Elaine  Cruz on 24/06/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import Foundation
import UIKit

class ChaptersViewController: UIViewController{
    
    //var chapterAvailable: bool[]
    @IBOutlet weak var chapterTitle: UILabel!
    @IBOutlet weak var chapterMap: UIView!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.centerXAnchor.constraint(equalTo:
            self.view.centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo:
            self.view.centerYAnchor).isActive = true
    }
}
