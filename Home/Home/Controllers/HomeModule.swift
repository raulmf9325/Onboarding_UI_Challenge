//
//  HomePage.swift
//  Home
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

/**
 Home Module Public Interface --> Exposed Behaviors to Home Module Consumers
 */
public protocol HomeProtocol{
    func presentHomePage(navigationController: UINavigationController?, completionHandler: @escaping () -> Void)
}

public class HomeModule: HomeProtocol{
    
    public init(){}
    
    public func presentHomePage(navigationController: UINavigationController?, completionHandler: @escaping () -> Void) {
        self.navigationController = navigationController
        self.completionHandler = completionHandler
        
        fetchTasksAndCategories { (categories) in
            self.home.setDataSourceWith(categories: categories)
        }
        
        navigationController?.pushViewController(home, animated: true)
        completionHandler()
    }
    
    func fetchTasksAndCategories(completionHandler: @escaping ([Category]) -> Void){
        // asynchronously fetch the categories
        Service.shared.fetchCategories { (result) in
            switch result{
            case .success(let categories):
                completionHandler(categories)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    /**
     stored properties
     */
    private var navigationController: UINavigationController?
    private let home = HomePage()
    private var completionHandler: (() -> Void)?
}
