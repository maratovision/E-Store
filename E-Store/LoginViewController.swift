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
        ml.textColor = UIColor(red: 0.322, green: 0.329, blue: 0.392, alpha: 1)
        ml.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return ml
    }()
    
    private lazy var imageIcon: UIImageView = {
        let image = UIImageView()
        
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        var sv = UIStackView()
        
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 16
        
        return sv
    }()
    
    private lazy var nameTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Username"
        tf.setLeftPaddingPoints(16)
        tf.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        
        return tf
    }()
    
    private lazy var passTextField: UITextField = {
        let tf = UITextField()
        
        tf.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.rightViewMode = .always
        tf.setLeftPaddingPoints(16)
        tf.snp.makeConstraints{
            $0.height.equalTo(60)
        }
        
        return tf
    }()
    
    private lazy var securityIcon: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage.init(named: "shape")
        icon.contentMode = .scaleAspectFit
        icon.isUserInteractionEnabled = true
        
        let iconTapped = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        icon.addGestureRecognizer(iconTapped)

        
        return icon
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Forget your password"
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Login"
        label.backgroundColor = UIColor(red: 0.127, green: 0.766, blue: 0.687, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        
        return label
    }()
    
    override func setupViews() {
        view.addSubview(mainLabel)
        view.addSubview(imageIcon)
        view.addSubview(stackView)
        view.addSubview(subLabel)
        view.addSubview(loginLabel)
        passTextField.rightView = securityIcon
        [nameTextField, passTextField].forEach{stackView.addArrangedSubview($0)}
    }
    
    override func setupConstrains() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        imageIcon.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLabel.snp.bottom).offset(60)
            $0.width.equalTo(100)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(imageIcon.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        securityIcon.snp.makeConstraints{
            $0.size.equalTo(26)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        loginLabel.snp.makeConstraints{
            $0.top.equalTo(subLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(315)
            $0.height.equalTo(60)
        }
    }
}
                                                
extension LoginViewController{
    @objc func iconTapped(){
        passTextField.isSecureTextEntry.toggle()
    }
}
