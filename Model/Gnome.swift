//
//  Brastlewark.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//


/*Model de Gnomo que conforma al protocolo
 Codable para facilitar el encoding y decoding
 de la data que viene del JSON obtenido del servidor*/

import Foundation

struct Gnome : Codable{
    var id : Int
    var name : String
    var thumbnail : String
    var age : Int
    var weight : Double
    var height : Double
    var hair_color : String
    var professions : [String]
    var friends : [String]
}
