//
//  LoginViewController.swift
//  E-Store
//
//  Created by Beks on 30/8/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController{
    
    private lazy var mainLabel: UILabel = {
        let ml = UILabel()
        
        ml.text = "Sign in"
        ml.textAlignment = .center
        ml.textColor = .black
        ml.font = UIFont.systemFont(ofSize: 18)
        
        return ml
    }()
    
    private lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "logo")
        
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        var sv = UIStackView()
        
        sv.axis = .vertical
        sv.distribution = .fillProportionally
        sv.spacing = 16
        sv = UIStackView(arrangedSubviews: [nameTextField, passTextField])
        
        return sv
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Username"
        
        return tf
    }()
    
    private lazy var passTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Password"
        
        return tf
    }()
    
    override func setupViews() {
        view.addSubview(mainLabel)
        view.addSubview(imageIcon)
        view.addSubview(stackView)
    }
    
    override func setupConstrains() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
        }
        
        imageIcon.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLabel.snp.bottom).offset(60)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(imageIcon.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(16)
        }
    }
}
