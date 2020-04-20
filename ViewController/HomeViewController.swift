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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var gnomes = [GnomeViewModel]()
    var gnomesSearch = [GnomeViewModel]()
    
    var gnomeToSend : GnomeViewModel?
    
    let cellIdentifier = "brastlewarkCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getData()
        setupSearchBar()
    }
    
    func setupSearchBar(){
        searchBar.delegate = self
        if #available(iOS 13.0, *) {
           searchBar.searchTextField.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func animateSearchBar(_ sender: Any) {
        animateBar()
    }
    
    func getData(){
        Service.shared.fetchPopulation { (data, error) in
            let gnomeViewModelArray = data?.gnomes.map({GnomeViewModel(gnome: $0)}) ?? []
            self.gnomes = gnomeViewModelArray
            self.gnomesSearch = gnomeViewModelArray
            self.tableView.reloadData()
        }
    }
    
    func animateBar(){
        self.heightSearchBar.constant = self.heightSearchBar.constant == 56 ? 0 : 56
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 1, options: .curveLinear, animations: {
            self.view.layoutIfNeeded()
            self.searchBar.becomeFirstResponder()
        }, completion: nil)
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "BrastlewarkTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let friendsController = destination as? FriendsViewController{
            friendsController.gnomeViewModel = gnomeToSend 
        }
    }
}


// MARK: Setteando UITableViewDataSource
extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gnomes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BrastlewarkTableViewCell
        cell.gnomeViewModel = gnomes[indexPath.row]
        cell.delegate = self
        
        return cell
    }
}


// MARK: Setteando UISearchBarDelegate
extension HomeViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancel")
        getData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchResult = gnomesSearch.filter({
            $0.name.lowercased().contains(searchText.lowercased())
        })
        
        print(searchResult.count)
        
        gnomes = searchResult
        tableView.reloadData()
    }
}

// MARK: Delegado para cuando se presiona boton de amigos en celdas
extension HomeViewController : FriendsButtonDelegate{
    func showFriends(gnome: GnomeViewModel) {
        print("hola")
    }
}
