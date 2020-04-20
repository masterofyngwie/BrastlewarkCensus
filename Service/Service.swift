//
//  Service.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation
import UIKit
import KRProgressHUD


//Singleton para obtener datos apartir de un Request hecho hacia una URL

class Service: NSObject {
    static let shared = Service()
    
    func fetchPopulation(completion: @escaping (Gnomes?, Error?) -> ()) {
        KRProgressHUD.show(withMessage: "Cargando población...")
        
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
                
                DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                   KRProgressHUD.dismiss()
                }
                
                DispatchQueue.main.async {
                    completion(data, nil)
                }
            } catch let jsonErr {
                print("Fallo para decodear:", jsonErr)
            }
            }.resume()
    }
    
    
}
