//
//  SigninPage.swift
//  Onboarding
//
//  Created by Raul Mena on 2/4/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

protocol SigninPageDelegate{
    func signinDidFinish()
    func goBack()
}

class SigninPage: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = view.frame
        self.view = SigninPageView(frame: frame, signinDelegate: self)
    }
    
    var signinDelegate: SigninPageDelegate!
}


extension SigninPage: SigninDelegate{
    func loginWith(username: String, password: String) {
        signinDelegate.signinDidFinish()
    }
    
    func signup() {
        
    }
    
    func rememberMeWith(username: String, password: String) {
        
    }
    
    func goBack(){
        signinDelegate.goBack()
    }
}
