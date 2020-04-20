//
//  Brastlewarks.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation

/*Model de Gnomos que conforma al protocolo
Codable para facilitar el encoding y decoding
de la data que viene del JSON obtenido del servidor
 para leer el arreglo de Brastlewark que viene arriba
 usa el enum especial CodingKeys para mappear tus
 valores con los del json a pesar de que tengan nombres
 diferentes y poder leerlos sin problema*/

struct Gnomes : Codable {
    var gnomes : [Gnome]
    
    enum CodingKeys: String, CodingKey {
      case  gnomes = "Brastlewark"
    }
}
