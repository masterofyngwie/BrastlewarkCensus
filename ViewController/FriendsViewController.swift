//
//  FriendsViewController.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 19/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let cellIdentifier = ""
    
    var gnomeViewModel : GnomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func cerrar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension FriendsViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gnomeViewModel?.friends.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendsCell", for: indexPath) as! FriendsCollectionViewCell
        
//        cell.gnomeViewModel = gnomeViewModel
        
        return cell
    }
}

extension FriendsViewController : UICollectionViewDelegate{
    
}
