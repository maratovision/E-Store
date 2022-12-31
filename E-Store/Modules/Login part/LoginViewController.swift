//
//  LoginViewController.swift
//  E-Store
//
//  Created by Beks on 30/8/22.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController{
    
    var viewModel = LoginViewModel()
    
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
        tf.delegate = self
        
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
        tf.delegate = self
        
        return tf
    }()
    
    private lazy var securityIcon: UIImageView = {
        let icon = UIImageView()
        
        icon.image = UIImage.init(named: "Shape")
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
        label.isUserInteractionEnabled = true
        let loginTapped = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        label.addGestureRecognizer(loginTapped)
        
        return label
    }()
    
    private lazy var miniLabel: UILabel = {
        let label = UILabel()
        
        label.text = "or"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        
        return label
    }()
    
    private lazy var socialStackView: UIStackView = {
        let sv = UIStackView()
        
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 8
        
        return sv
    }()
    
    private lazy var facebookIcon: UIImageView = {
        let icon = UIImageView()

        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "facebook")

        return icon
    }()

    private lazy var twitterIcon: UIImageView = {
        let icon = UIImageView()

        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "twitter")

        return icon
    }()

    private lazy var linkedInIcon: UIImageView = {
        let icon = UIImageView()

        icon.contentMode = .scaleAspectFit
        icon.image = UIImage(named: "linkedin")

        return icon
    }()
    
    private lazy var facebookLabel:UILabel = {
        let label = UILabel()
        
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.886, green: 0.886, blue: 0.878, alpha: 1).cgColor
        label.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }

        return label
    }()

    private lazy var twitterLabel:UILabel = {
        let label = UILabel()

        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.886, green: 0.886, blue: 0.878, alpha: 1).cgColor
        label.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }

        return label
    }()

    private lazy var linkedInLabel:UILabel = {
        let label = UILabel()

        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor(red: 0.886, green: 0.886, blue: 0.878, alpha: 1).cgColor
        label.snp.makeConstraints{
            $0.height.equalTo(60)
            $0.width.equalTo(100)
        }

        return label
    }()
    
    private lazy var footerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Don't have an account? Sign Up"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.514, green: 0.514, blue: 0.569, alpha: 1)
        label.isUserInteractionEnabled = true
        let tappedSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        label.addGestureRecognizer(tappedSignUp)
        return label
    }()
    
    override func setupViews() {
        view.addSubview(mainLabel)
        view.addSubview(imageIcon)
        view.addSubview(stackView)
        view.addSubview(subLabel)
        view.addSubview(loginLabel)
        view.addSubview(miniLabel)
        view.addSubview(socialStackView)
        view.addSubview(footerLabel)
        facebookLabel.addSubview(facebookIcon)
        twitterLabel.addSubview(twitterIcon)
        linkedInLabel.addSubview(linkedInIcon)
        
        passTextField.rightView = securityIcon
        [facebookLabel, twitterLabel, linkedInLabel].forEach{socialStackView.addArrangedSubview($0)}
        [nameTextField, passTextField].forEach{stackView.addArrangedSubview($0)}
        
    }
    
    override func setupConstrains() {
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(computedHeight(30))
        }
        
        imageIcon.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLabel.snp.bottom).offset(computedHeight(30))
            $0.width.equalTo(computedWidth(100))
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalTo(imageIcon.snp.bottom).offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        securityIcon.snp.makeConstraints{
            $0.size.equalTo( 26)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(computedHeight(14))
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        loginLabel.snp.makeConstraints{
            $0.top.equalTo(subLabel.snp.bottom).offset(computedHeight(50))
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.width.equalTo(computedWidth(315))
            $0.height.equalTo(computedHeight(60))
        }
        
        miniLabel.snp.makeConstraints{
            $0.top.equalTo(loginLabel.snp.bottom).offset(computedHeight(16))
            $0.centerX.equalToSuperview()
        }
        
        socialStackView.snp.makeConstraints{
            $0.top.equalTo(miniLabel.snp.bottom).offset(computedHeight(16))
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        facebookIcon.snp_makeConstraints{
            $0.centerX.equalTo(facebookLabel)
            $0.centerY.equalTo(facebookLabel)
            $0.size.equalTo(15)
        }
        
        twitterIcon.snp_makeConstraints{
            $0.centerX.equalTo(twitterLabel)
            $0.centerY.equalTo(twitterLabel)
            $0.size.equalTo(15)
        }

        linkedInIcon.snp_makeConstraints{
            $0.centerX.equalTo(linkedInLabel)
            $0.centerY.equalTo(linkedInLabel)
            $0.size.equalTo(15)
        }
        
        footerLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(socialStackView.snp.bottom).offset(computedHeight(35))
        }
    }
    
    override func setupValues() {
        viewModel.isUserAuthorized = {(isUserAuthorized) in
            if isUserAuthorized{
                self.appDelegate.mainApp()
            } else{
                print("idiot")
            }
        }
    }
}
                                                
extension LoginViewController{
    @objc func iconTapped(){
        passTextField.isSecureTextEntry.toggle()
    }
    
    @objc func signUpTapped(){
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginTapped(){
        guard let login = nameTextField.text, let password = passTextField.text else {return}
        if !login.isEmpty && !password.isEmpty{
            viewModel.authorizeUser(login: login, password: password)
        }
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
