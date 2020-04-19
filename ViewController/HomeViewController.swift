//
//  HomeViewController.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var heightSearchBar: NSLayoutConstraint!
    
    var gnomes = [GnomeViewModel]()
    
    let cellIdentifier = "brastlewarkCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getData()
    }
    
    @IBAction func animateSearchBar(_ sender: Any) {
        animateBar()
    }
    
    func getData(){
        Service.shared.fetchPopulation { (data, error) in
            self.gnomes = data?.gnomes.map({GnomeViewModel(gnome: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    func animateBar(){
        self.heightSearchBar.constant = self.heightSearchBar.constant == 56 ? 0 : 56
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "BrastlewarkTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension HomeViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BrastlewarkTableViewCell
        cell.gnomeViewModel = gnomes[indexPath.row]
        cell.tag = indexPath.row
    
        return cell
    }
}

extension HomeViewController : UITableViewDelegate{
    
}
