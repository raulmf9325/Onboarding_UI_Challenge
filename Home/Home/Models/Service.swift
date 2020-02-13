//
//  Service.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

class Service{
    static let shared = Service()
    
    // This data would be retrieved from an API
    func fetchCategories(completionHandler: @escaping (Result<[Category], Error>) -> Void){
        // Asynchronoulsy fetch the data and execute completion handler upon completion
        let categories = [Category(categoryName: "Personal", numberOfTasks: 12, image: UIImage(named: "personalImage")),
            Category(categoryName: "Shopping", numberOfTasks: 9, image: UIImage(named: "shoppingImage")),
            Category(categoryName: "Sport", numberOfTasks: 10, image: UIImage(named: "sportImage")),
            Category(categoryName: "Event", numberOfTasks: 10, image: UIImage(named: "eventImage")),
            Category(categoryName: "Work", numberOfTasks: 25, image: UIImage(named: "workImage")),
            Category(categoryName: "Personal", numberOfTasks: 12, image: UIImage(named: "personalImage")),
            Category(categoryName: "Shopping", numberOfTasks: 9, image: UIImage(named: "shoppingImage"))
        ]
        
        completionHandler(.success(categories))
    }
}
