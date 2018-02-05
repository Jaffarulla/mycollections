//
//  Model.swift
//  ProjectAssignment
//
//  Created by apple on 2/3/18.
//  Copyright © 2018 jaffar. All rights reserved.
//

import UIKit

struct Hero: Decodable{
    
    let localized_name: String
    let img: String
    let name: String
    let attack_type: String
    let base_health: Int
    let base_attack_min: Float
    let base_attack_max: Float
    
}

