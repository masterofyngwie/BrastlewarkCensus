//
//  ImageExtension.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import Foundation
import UIKit
import KRProgressHUD

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImage(urlString : String){
        self.image = nil
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: self.frame.width/2 - 100, y: self.frame.width/2 - 100, width: 200, height: 200))
        loadingIndicator.startAnimating()
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.color = .white
        loadingIndicator.style = .large
        self.addSubview(loadingIndicator)
        
        //Checar cache para la imagen primero
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage{
            self.image = cachedImage
            loadingIndicator.removeFromSuperview()
            return
        }
        
        //Si no hay cache bajar imagen
        let url = URL.init(string: urlString)!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        loadingIndicator.stopAnimating()
                        
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

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

