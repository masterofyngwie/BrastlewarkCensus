//
//  GnomeViewModel.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation
import UIKit

class GnomeViewModel{
    
    let name            : String
    let age             : String
    let height          : String
    let weight          : String
    let hairColor       : String
    let thumbnailURL    : String
    let amigosTexto     : String
    let gnome           : Gnome
    
    
    //dependency injection
    init(gnome : Gnome){
        
        self.gnome = gnome
        
        self.name       = gnome.name
        self.age        = String(gnome.age)
        self.height     = String(format: "%.2f", gnome.height)
        self.weight     = String(format: "%.2f", gnome.weight)
        self.hairColor  = gnome.hair_color
        self.thumbnailURL = gnome.thumbnail
        self.amigosTexto = gnome.friends.joined(separator: ",")
        
        print(gnome.friends.count)
    }
    
    
}
