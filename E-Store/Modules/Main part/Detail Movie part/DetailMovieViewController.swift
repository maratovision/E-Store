//
//  DetailMovieViewController.swift
//  E-Store
//
//  Created by Neobis on 4/1/23.
//

import UIKit
import SnapKit
import Kingfisher


class DetailMovieViewController: BaseViewController{
    
    private lazy var moviePoster: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "banner")
        
        return image
    }()
    
    private lazy var movieTitle: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.text = "Batman 2020"
        title.textColor = UIColor(red: 0.373, green: 0.008, blue: 0.357, alpha: 1)
        title.textAlignment = .left
        
        return title
    }()
    
    private lazy var movieDuration: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.text = "152 minutes"
        title.textAlignment = .left
        
        return title
    }()
    
    private lazy var movieMark: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.textAlignment = .center
        title.text = "7.0 (IMDb)"
        
        return title
    }()
    
    private lazy var movieDate: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.text = "Release date"
        title.textAlignment = .center
        
        return title
    }()
    
    private lazy var movieGenre: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.text = "Genre"
        title.textAlignment = .center
        
        return title
    }()
    
    private lazy var movieGenreData: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.textAlignment = .left
        title.textColor = UIColor(red: 0.373, green: 0.008, blue: 0.357, alpha: 1)
        
        return title
    }()
    
    private lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.373, green: 0.008, blue: 0.357, alpha: 1)
        label.text = "December 9, 2017"
        
        return label
    }()
    
    private lazy var movieSynopis: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.text = "Synopsis"
        title.textColor = UIColor(red: 0.373, green: 0.008, blue: 0.357, alpha: 1)
        title.textAlignment = .center
        
        return title
    }()
    
    private lazy var movieDescription: UILabel = {
        let title = UILabel()
        
        title.font = .systemFont(ofSize: 12, weight: .regular)
        title.textAlignment = .left
        title.numberOfLines = 0
        title.text = "Rey (Daisy Ridley) finally manages to find the legendary Jedi knight, Luke Skywalker (Mark Hamill) on an island with a magical aura. The heroes of The Force Awakens including Leia, Finn Read more.."
        
        return title
    }()
    
    var id: Int
    var posterPath: String
    
    init(id: Int, posterPath: String){
        self.id = id
        self.posterPath = posterPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let networkManager = NetworkManager()
    
    override func setupViews() {
        view.addSubview(moviePoster)
        view.addSubview(movieTitle)
        view.addSubview(movieDuration)
        view.addSubview(movieMark)
        view.addSubview(movieDate)
        view.addSubview(movieGenre)
        view.addSubview(movieReleaseDate)
        view.addSubview(movieSynopis)
        view.addSubview(movieDescription)
        view.addSubview(movieGenreData)
        getMovieData()
        
        
    }
    
    override func setupConstrains() {
        moviePoster.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(350)
            $0.width.equalTo(428)
        }
        
        movieTitle.snp.makeConstraints{
            $0.top.equalTo(moviePoster.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        movieDuration.snp.makeConstraints{
            $0.top.equalTo(movieTitle.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
        }
        
        movieMark.snp.makeConstraints{
            $0.top.equalTo(movieTitle.snp.bottom).offset(12)
            $0.leading.equalTo(movieDuration.snp.trailing).offset(18)
        }
        
        movieDate.snp.makeConstraints{
            $0.top.equalTo(movieDuration.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(16)
        }
        
        movieGenre.snp.makeConstraints{
            $0.top.equalTo(movieDuration.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(140)
        }
        
        movieGenreData.snp.makeConstraints{
            $0.top.equalTo(movieGenre.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(140)
        }
        
        movieReleaseDate.snp.makeConstraints{
            $0.top.equalTo(movieDate.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(16)
        }
        
        movieSynopis.snp.makeConstraints{
            $0.top.equalTo(movieReleaseDate.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(16)
        }
        
        movieDescription.snp.makeConstraints{
            $0.top.equalTo(movieSynopis.snp.bottom).offset(22)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().inset(86)
        }
    }
    
    override func setupValues() {
    }
    
    func getMovieData(){
        networkManager.getDetailData(id: id){ (response) in
            DispatchQueue.main.async {
                self.movieTitle.text = response.original_title
                self.movieDuration.text = (response.runtime?.description ?? "") + " minutes"
                self.movieDescription.text = response.overview
                self.moviePoster.kf.setImage(with: URL(string: self.networkManager.getImage(endPath: response.poster_path!)))
                self.movieReleaseDate.text = response.release_date
                self.movieGenreData.text = response.genres?[0].name
                self.movieMark.text = (response.budget?.description ?? "") + "$"
            }
        }
    }
}
