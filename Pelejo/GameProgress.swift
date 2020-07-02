//
//  GameProgress.swift
//  Pelejo
//
//  Created by Erick Almeida on 01/07/20.
//  Copyright © 2020 Elaine  Cruz. All rights reserved.
//

import Foundation

class GameProgress {
    
    var hungry: Int = 100
    var thirst: Int = 100
    var sadness: Int = 100
    
    static public let shared = GameProgress()

    private init() {
    }
    
}
