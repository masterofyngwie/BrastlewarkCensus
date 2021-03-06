//
//  HomeViewController.swift
//  BrastlewarkCensus
//
//  Created by Jorge on 18/04/20.
//  Copyright © 2020 jorge. All rights reserved.
//

import UIKit

//ViewController que se encarga de la pantalla principal de la aplicacion. Se utilizo el patron de diseño de arquitectura MVVM para conectar el Modelo con la vista.

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
        searchBar.showsCancelButton = true
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
            
            if self.heightSearchBar.constant < 56{
                self.view.endEditing(true)
            }
            
        }, completion: nil)
        
    }
    
    func setupTableView(){
        tableView.register(UINib(nibName: "BrastlewarkTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 600
        tableView.rowHeight = UITableView.automaticDimension
    }

    
    func restoreData(){
        animateBar()
        searchBar.searchTextField.resignFirstResponder()
        gnomes = gnomesSearch
        tableView.reloadData()
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
        return cell
    }
}


// MARK: Setteando UISearchBarDelegate
extension HomeViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        restoreData()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 0{
            let searchResult = gnomesSearch.filter({
                $0.name.lowercased().contains(searchText.lowercased())
            })
            
            gnomes = searchResult
            tableView.reloadData()
        }else{
            restoreData()
        }
    }
}

