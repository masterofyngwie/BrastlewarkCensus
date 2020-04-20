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
    let gnome           : Gnome
    let friends         : [String]
    let isActiveFriends : Bool
    let tituloBotonFriends : String
    
    
    
    //dependency injection
    init(gnome : Gnome){
        self.gnome = gnome
        self.name               = gnome.name
        self.age                = String(gnome.age)
        self.height             = String(format: "%.2f", gnome.height)
        self.weight             = String(format: "%.2f", gnome.weight)
        self.hairColor          = gnome.hair_color
        self.thumbnailURL       = gnome.thumbnail
        self.friends            = gnome.friends
        self.isActiveFriends    = gnome.friends.count > 0 ? true : false
        self.tituloBotonFriends = gnome.friends.count > 0 ? "Ver Amigos" : "No tiene amigos"
    }
}
