//
//  BrastlewarkTableViewCell.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import UIKit
import Pastel

//Aqui se puede encontrar toda la logica de celda la cual es obtenida de un GnomeViewModel que se encarga de procesar toda la logica de las vistas.
class BrastlewarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: PastelView!
    @IBOutlet weak var thumbnailImagen: UIImageView!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var hairColor: UIView!
    @IBOutlet weak var textoAmigos: UILabel!
    
    var gnomeViewModel : GnomeViewModel!{
        didSet{
            self.age.text       = gnomeViewModel.age
            self.weight.text    = gnomeViewModel.weight
            self.height.text    = gnomeViewModel.height
            self.name.text      = gnomeViewModel.name
            self.thumbnailImagen.loadImage(urlString: gnomeViewModel.thumbnailURL)
            self.hairColor.backgroundColor = gnomeViewModel.hairColor
            self.textoAmigos.text   = gnomeViewModel.textoAmigos
//            self.friendsButton.isEnabled = gnomeViewModel.isActiveFriends
//            self.friendsButton.setTitle(gnomeViewModel.tituloBotonFriends, for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        animateBackView()
    }
    
    private func animateBackView(){
        
        backView.clipsToBounds = true
        backView.startPastelPoint = .bottomLeft
        backView.endPastelPoint = .topRight
        
        // Custom Duration
           backView.animationDuration = 2.0

           // Custom Color
           backView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                                 UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                                 UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0)])
        
        backView.startAnimation()
        
        backView.addShadow()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


