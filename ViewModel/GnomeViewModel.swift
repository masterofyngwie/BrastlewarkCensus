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
    let thumbnailURL    : String
    let gnome           : Gnome
    let friends         : [String]
    let isActiveFriends : Bool
    let tituloBotonFriends : String
    var hairColor: UIColor!
    let textoAmigos     : String
    
    
    enum HairColor : String {
        case Red
        case Blue
        case Gray
        case Purple
        case Pink
        case Yellow
        case Green
        case Black
        case Brown
    }
    
    
    //dependency injection
    init(gnome : Gnome){
        self.gnome = gnome
        self.name               = gnome.name
        self.age                = String(gnome.age)
        self.height             = String(format: "%.2f", gnome.height)
        self.weight             = String(format: "%.2f", gnome.weight)
        self.thumbnailURL       = gnome.thumbnail
        self.friends            = gnome.friends
        self.isActiveFriends    = gnome.friends.count > 0 ? true : false
        self.tituloBotonFriends = gnome.friends.count > 0 ? "Ver Amigos" : "No tiene amigos"
        self.textoAmigos        = gnome.friends.count > 0 ? gnome.friends.joined(separator: ",") : "No tiene amigos 😭💔"

        getGnomeHairColor(gnome.hair_color)
    }
    
    private func getGnomeHairColor(_ color : String){
        if let hairColor = HairColor(rawValue: color){
            switch hairColor {
            case .Red:
                self.hairColor = .red
            case .Blue:
                self.hairColor = .blue
            case .Gray:
                self.hairColor = .gray
            case .Purple:
                self.hairColor = .purple
            case .Pink:
                self.hairColor = .cyan
            case .Yellow:
                self.hairColor = .yellow
            case .Green:
                self.hairColor = .green
            case .Black:
                self.hairColor = .black
            case .Brown:
                self.hairColor = .brown
            }
        }
    }
    
}


