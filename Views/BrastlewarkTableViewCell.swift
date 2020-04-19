//
//  BrastlewarkTableViewCell.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import UIKit

class BrastlewarkTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var thumbnailImagen: UIImageView!
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var amigos: UILabel!
    
    var gnomeViewModel : GnomeViewModel!{
        didSet{
            self.age.text       = gnomeViewModel.age
            self.weight.text    = gnomeViewModel.weight
            self.height.text    = gnomeViewModel.height
            self.name.text      = gnomeViewModel.name
            self.thumbnailImagen.loadImage(urlString: gnomeViewModel.thumbnailURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func draw(_ rect: CGRect) {
        backView.addShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


