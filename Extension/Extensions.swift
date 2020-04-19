//
//  ImageExtension.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation
import UIKit


let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImage(urlString : String){
        self.image = nil
        
        //Checar cache para la imagen primero
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage{
            self.image = cachedImage
            return
        }
        
        //Si no hay cache bajar imagen
        let url = URL.init(string: urlString)!
        
//        print(url.absoluteString)
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UIView {
    func addShadow(){
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.4, height: 2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.6
        self.layer.shadowRadius = 5
    }
}

