//
//  ViewController.swift
//  Application
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit
import Authentication
import Home

class ApplicationController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupApplicationController()
    }
    
    func setupApplicationController(){
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        let auth = AuthenticationModule()
        if auth.userIsAuthenticated(){
            presentHomeScreen()
        }
        else{
            // present authentication pages
            auth.authenticateUser(navigationController: navigationController) {
                self.presentHomeScreen()
            }
        }
    }
    
    func presentHomeScreen(){
        let home = HomeModule()
        home.presentHomePage(navigationController: navigationController){
            // control is returned to main app
        }
    }
    
}

