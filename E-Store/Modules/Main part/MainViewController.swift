//
//  MainViewController.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController{
    
    private lazy var viewModel: MainViewModel = {
        return MainViewModel(delegate: self)
    }()
    
    private lazy var movieTableView: UITableView = {
        let tv = UITableView()
        
        tv.delegate = self
        tv.dataSource = self
        
        return tv
    }()
    
    override func setupViews() {
        view.addSubview(movieTableView)
    }
    
    override func setupConstrains() {
        movieTableView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func setupValues() {
        viewModel.getAllMovie()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = self.viewModel.movies[indexPath.row]
        let cell = MainTableViewCell()
        
        cell.fill(model: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}

extension MainViewController: MainDelegate {
    func showMovie() {
        self.movieTableView.reloadData()
    }
}
