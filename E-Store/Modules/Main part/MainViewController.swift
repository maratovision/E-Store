//
//  MainViewController.swift
//  E-Store
//
//  Created by Beksultan Maratov on 1/1/23.
//

import UIKit
import SnapKit

class MainViewController: BaseViewController{
    
    private lazy var movieTableView: UITableView = {
        let tv = UITableView()
        
        tv.delegate = self
        tv.dataSource = self
        tv.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
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
    
    var popularMovies: PopularMovies?
    
    var viewModel: MainViewModelProtocol
    
    init(viewModel: MainViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupValues() {
        super.setupValues()
        viewModel.getPopularMovie{ [weak self] (movies) in
            self?.popularMovies = movies
            DispatchQueue.main.async {
                self?.movieTableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies = popularMovies, let result = movies.results else {return 0}
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        
        if let popularMovies = popularMovies, let result = popularMovies.results{
            let movie = result[indexPath.row]
            cell.confug(movie: movie)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

