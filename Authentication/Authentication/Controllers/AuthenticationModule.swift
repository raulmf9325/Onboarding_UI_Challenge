//
//  AuthenticationController.swift
//  Authentication
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

/**
 Authentication Module Public Interface --> Exposed Behaviors to Auth Module Consumers
 */
public protocol AuthenticationProtocol{
    func userIsAuthenticated() -> Bool
    func authenticateUser(navigationController: UINavigationController?, completionHandler: @escaping () -> Void)
}

public class AuthenticationModule: AuthenticationProtocol{
    public init(){}
    public func userIsAuthenticated() -> Bool{
        // check if user is logged in
        return false
    }
    
    public func authenticateUser(navigationController: UINavigationController?, completionHandler: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completionHandler = completionHandler
        presentOnboardPages()
    }
    
    func presentOnboardPages(){
        let onboardPageController = OnboardPageController()
        onboardPageController.onboardPageControllerDelegate = self
        navigationController?.pushViewController(onboardPageController, animated: true)
    }
    
    /**
     stored properties
     */
    private var navigationController: UINavigationController?
    private var completionHandler: (() -> Void)?
}

extension AuthenticationModule: OnboardPageControllerDelegate{
    func onboardDidFinish() {
        let signinPage = SigninPage()
        signinPage.signinDelegate = self
        navigationController?.pushViewController(signinPage, animated: true)
    }
}

extension AuthenticationModule: SigninPageDelegate{
    func signinDidFinish() {
        guard let handler = completionHandler else {return}
        handler()
    }
    
    func goBack() {
        navigationController?.popViewController(animated: false)
        presentOnboardPages()
    }
}


