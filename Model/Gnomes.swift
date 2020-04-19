//
//  Brastlewarks.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation

struct Gnomes : Codable {
    var gnomes : [Gnome]
    
    enum CodingKeys: String, CodingKey {
      case  gnomes = "Brastlewark"
    }
}
