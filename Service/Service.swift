//
//  Service.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation
import UIKit

//Singleton para obtener datos de urls

class Service: NSObject {
    static let shared = Service()
    
    func fetchPopulation(completion: @escaping (Gnomes?, Error?) -> ()) {
        let urlString = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Error para recolectar el censo!", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(Gnomes.self, from: data)
                
                print(data.gnomes.count)
                
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            } catch let jsonErr {
                print("Fallo para decodear:", jsonErr)
            }
            }.resume()
    }
    
    
}
