//
//  SigninPageView.swift
//  Onboarding
//
//  Created by Raul Mena on 2/9/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

protocol SigninDelegate{
    func loginWith(username: String, password: String)
    func signup()
    func rememberMeWith(username: String, password: String)
    func goBack()
}

class SigninPageView: UIView{
    
    init(frame: CGRect, signinDelegate: SigninDelegate){
        super.init(frame: frame)
        self.signinDelegate = signinDelegate
        screenWidth = frame.width
        screenHeight = frame.height
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        backgroundColor = .white
        addBackButton()
        addSigninLabel()
        addUsernameTextField()
        addTopDivider()
        addPasswordTextField()
        addBottomDivider()
        addCheckBoxButton()
        addRememberMeLabel()
        addForgotPasswordLabel()
        addLoginButton()
        addNewUserLabel()
        addSignupButton()
        
        addTapGestureRecognizer()
    }
    
    @objc private func handleTapOnLogin(){
        signinDelegate?.loginWith(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc private func handleTapOnBackButton(){
        signinDelegate?.goBack()
    }
    
    @objc private func handleTapOnRememberMe(){
        signinDelegate?.rememberMeWith(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc private func handleTapOnSignup(){
        signinDelegate?.signup()
    }
    
    private func addTapGestureRecognizer(){
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnView)))
    }
    
    func addSignupButton(){
        addSubview(signupButton)
        let width = screenWidth / 8
        
        signupButton.anchor(top: newUserLabel.topAnchor, leading: centerXAnchor, width: width)
        signupButton.heightAnchor.constraint(equalTo: newUserLabel.heightAnchor).isActive = true
        signupButton.addTarget(self, action: #selector(handleTapOnSignup), for: .touchUpInside)
    }
    
    func addNewUserLabel(){
        addSubview(newUserLabel)
        let topPadding = screenHeight / 58
        let width = screenWidth / 3.75
        
        newUserLabel.anchor(top: loginButton.bottomAnchor, trailing: centerXAnchor, width: width, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        newUserLabel.heightAnchor.constraint(equalTo: rememberMeLabel.heightAnchor).isActive = true
    }
    
    func addLoginButton(){
        addSubview(loginButton)
        let topPadding = screenHeight / 2.0
        let height = screenHeight / 16.24
        
        loginButton.anchor(top: topAnchor, leading: passwordTextField.leadingAnchor, trailing: passwordTextField.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        
        loginButton.addTarget(self, action: #selector(handleTapOnLogin), for: .touchUpInside)
    }
    
    func addBackButton(){
        addSubview(backButton)
        let leftPadding = screenWidth / 12.93
        let topPadding = screenHeight / 13.53
        let width = screenWidth / 19.53
        let height = screenHeight / 68.17
        
        backButton.anchor(top: topAnchor, leading: leadingAnchor, height: height, width: width, padding: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: 0, right: 0))
        
        backButton.addTarget(self, action: #selector(handleTapOnBackButton), for: .touchUpInside)
    }
    
    func addSigninLabel(){
        addSubview(signinLabel)
        let topPadding = frame.height / 6.77
        let rightPadding = screenWidth / 12.93
        let height = screenHeight / 12.3
        
        signinLabel.anchor(top: topAnchor, leading: backButton.leadingAnchor, trailing: trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: rightPadding))
    }
    
    func addUsernameTextField(){
        addSubview(usernameTextField)
        let topPadding = frame.height / 3.74
        let height = screenHeight / 33.83
        
        usernameTextField.anchor(top: topAnchor, leading: signinLabel.leadingAnchor, trailing: signinLabel.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        usernameTextField.delegate = self
    }
    
    func addTopDivider(){
        addSubview(topDividerLine)
        let topPadding = screenHeight / 3.24
        let height = CGFloat(1)
        
        topDividerLine.anchor(top: topAnchor, leading: signinLabel.leadingAnchor, trailing: signinLabel.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        topLineHeightAnchor = topDividerLine.heightAnchor.constraint(equalToConstant: height)
        topLineHeightAnchor.isActive = true
    }
    
    func addPasswordTextField(){
        addSubview(passwordTextField)
        let topPadding = frame.height / 2.73
        let height = screenHeight / 33.83
        
        passwordTextField.anchor(top: topAnchor, leading: signinLabel.leadingAnchor, trailing: signinLabel.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        passwordTextField.delegate = self
    }
    
    func addBottomDivider(){
        addSubview(bottomDividerLine)
        let topPadding = screenHeight / 2.5
        let height = CGFloat(1)
        
        bottomDividerLine.anchor(top: topAnchor, leading: signinLabel.leadingAnchor, trailing: signinLabel.trailingAnchor, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        bottomLineHeightAnchor = bottomDividerLine.heightAnchor.constraint(equalToConstant: height)
        bottomLineHeightAnchor.isActive = true
    }
    
    func addCheckBoxButton(){
        addSubview(checkBoxButton)
        let topPadding = screenHeight / 2.43
        let width = screenWidth / 18.75
        let height = width
        
        checkBoxButton.anchor(top: topAnchor, leading: backButton.leadingAnchor, height: height, width: width, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
    }
    
    func addRememberMeLabel(){
        addSubview(rememberMeLabel)
        let leftPadding = screenWidth / 6.82
        let width = screenWidth / 4.8
        
        rememberMeLabel.anchor(top: checkBoxButton.topAnchor, leading: leadingAnchor, width: width, padding: UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0))
        rememberMeLabel.heightAnchor.constraint(equalTo: checkBoxButton.heightAnchor).isActive = true
    }
    
    func addForgotPasswordLabel(){
        addSubview(forgotPasswordLabel)
        let width = screenWidth / 3.9
        
        forgotPasswordLabel.anchor(top: checkBoxButton.topAnchor, trailing: passwordTextField.trailingAnchor, width: width)
        forgotPasswordLabel.heightAnchor.constraint(equalTo: checkBoxButton.heightAnchor).isActive = true
    }
    
    @objc func handleTapOnView(){
        topLineHeightAnchor.constant = 1
        bottomLineHeightAnchor.constant = 1
        topDividerLine.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
        bottomDividerLine.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
        endEditing(true)
    }
    
    /**
     stored properties
     */
    private var signinDelegate: SigninDelegate?
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "BackArrow"), for: .normal)
        return button
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.placeholder = "Username"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Roboto-Regular", size: 15)
        textField.placeholder = "Password"
        return textField
    }()
    
    let topDividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
        return view
    }()
    
    let bottomDividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
        return view
    }()
    
    let checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "CheckBox_Unchecked"), for: .normal)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 15)
        button.backgroundColor = UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 5
        return button
    }()
    
    let signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("Signup", for: .normal)
        button.setTitleColor(UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 13)
        button.titleLabel?.textAlignment = .left
        return button
    }()
    
    let signinLabel = getLabel(text: "Sign In", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "ProximaNova-Bold", size: 35), textColor: UIColor(red: 15/255, green: 25/255, blue: 80/255, alpha: 1), textAlignment: nil)
    
    let newUserLabel = getLabel(text: "New user?", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "Roboto-Regular", size: 13), textColor: UIColor(red: 75/255, green: 84/255, blue: 97/255, alpha: 0.45), textAlignment: .right)
    
    let rememberMeLabel = getLabel(text: "Remember Me", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "Roboto-Regular", size: 13), textColor: UIColor(red: 75/255, green: 84/255, blue: 97/255, alpha: 0.45), textAlignment: nil)
    
    let forgotPasswordLabel = getLabel(text: "Forgot Password?", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "Roboto-Regular", size: 13), textColor: UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1), textAlignment: nil)
    
    var topLineHeightAnchor: NSLayoutConstraint!
    var bottomLineHeightAnchor: NSLayoutConstraint!
}

/**
 Textfield Delegate
 */
extension SigninPageView: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == usernameTextField{
            topDividerLine.backgroundColor = UIColor(red: 10/255, green: 212/255, blue: 135/255, alpha: 1)
            bottomDividerLine.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
            topLineHeightAnchor.constant = 2
            bottomLineHeightAnchor.constant = 1
        }
        else if textField == passwordTextField{
            topDividerLine.backgroundColor = UIColor(red: 211/255, green: 223/255, blue: 239/255, alpha: 1)
            bottomDividerLine.backgroundColor = UIColor(red: 10/255, green: 212/255, blue: 135/255, alpha: 1)
            topLineHeightAnchor.constant = 1
            bottomLineHeightAnchor.constant = 2
        }
        
        return true
    }
}
