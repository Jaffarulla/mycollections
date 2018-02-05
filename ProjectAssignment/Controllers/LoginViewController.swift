//
//  ViewController.swift
//  LoginScreen
//
//  Created by apple on 2/2/18.
//  Copyright © 2018 jaffar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , UITextFieldDelegate{

    
    let userNameTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.borderStyle = .none
        emailTextField.layer.cornerRadius = 5
        emailTextField.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.4)
        emailTextField.textColor = UIColor(white: 0.9, alpha: 0.8)
        emailTextField.font = UIFont.systemFont(ofSize: 15)
        emailTextField.autocorrectionType = .no
        emailTextField.tintColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.clearButtonMode = .always
        emailTextField.clearButtonMode = .whileEditing
        // placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        emailTextField.attributedPlaceholder = placeholder
        return emailTextField
        
    }()
    
    let passwordTextField: UITextField = {
        let passTextField = UITextField()
        passTextField.borderStyle = .none
        passTextField.layer.cornerRadius = 5
        passTextField.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.4)
        passTextField.textColor = UIColor(white: 0.9, alpha: 0.8)
        passTextField.font = UIFont.systemFont(ofSize: 15)
        passTextField.autocorrectionType = .no
        passTextField.tintColor = .black
        passTextField.isSecureTextEntry = true
        passTextField.clearButtonMode = .always
        passTextField.clearButtonMode = .whileEditing
        // placeholder
        var placeholder = NSMutableAttributedString()
        placeholder = NSMutableAttributedString(attributedString: NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor(white: 1, alpha: 0.7)]))
        passTextField.attributedPlaceholder = placeholder
        return passTextField
        
    }()
    let loginButton: UIButton = {
        let lgButton = UIButton(type:.custom)
        lgButton.setTitle("Login", for: .normal)
        lgButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        lgButton.setTitleColor(UIColor.white, for: .normal)
        lgButton.backgroundColor = .red
        lgButton.addTarget(self, action: #selector(LoginViewController.handleNext), for: .touchUpInside)
        return lgButton
        
    }()
    
    @objc private func handleNext(){
        
        if ((userNameTextField.text?.contains("admin@gmail.com"))! && (passwordTextField.text?.contains ("admin123"))!) {
            
            let st:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let dv = st.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(dv, animated: true)
           
            
        }else{
            
        let dialogMessage = UIAlertController(title: "Oops!", message: "Username or password is incorrect", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
        })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
            
      }
    }
    
    let loginTitle: UILabel = {
        let logitl = UILabel()
        logitl.text = "Login Details"
        logitl.textColor = UIColor.white
        logitl.textAlignment = .center
        logitl.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        return logitl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       view.backgroundColor = UIColor(red: 5/255, green: 98/255, blue: 198/255, alpha: 1)
        setupContraints()
    
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            self.navigationController?.isNavigationBarHidden = false
        }
   
    
   
  fileprivate  func setupContraints(){
        setupEmail()
        setupPassword()
        setupLogin()
        setupLabel()
    }
    
   fileprivate func setupEmail(){
        view.addSubview(userNameTextField)
        userNameTextField.anchors(top: nil, topPadding: 0, bottom: nil, botPadding: 0, left: view.safeAreaLayoutGuide.leftAnchor, leftPadding: 20, right: view.rightAnchor, rightPadding: 20, height: 40, width: 0)
        userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant:-60).isActive = true
    }
    fileprivate func setupPassword(){
        view.addSubview(passwordTextField)
        passwordTextField.anchors(top: userNameTextField.bottomAnchor, topPadding: 10, bottom: nil, botPadding: 0, left: userNameTextField.leftAnchor, leftPadding: 0, right:userNameTextField.rightAnchor, rightPadding: 0, height: 40, width: 0)
    }
   
    fileprivate func setupLogin(){
      view.addSubview(loginButton)
        loginButton.anchors(top: passwordTextField.bottomAnchor, topPadding: 10, bottom: nil, botPadding: 0, left: passwordTextField.leftAnchor, leftPadding: 0, right: passwordTextField.rightAnchor, rightPadding: 0, height: 40, width: 0)

    }
    fileprivate func setupLabel(){
        view.addSubview(loginTitle)
        loginTitle.anchors(top: view.safeAreaLayoutGuide.topAnchor, topPadding: 30, bottom: nil, botPadding: 0, left: view.leftAnchor, leftPadding: 100, right: view.rightAnchor, rightPadding: 100, height: 30, width: 75)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

