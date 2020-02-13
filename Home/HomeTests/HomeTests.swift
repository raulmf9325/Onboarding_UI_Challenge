//
//  HomeTests.swift
//  HomeTests
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import XCTest
@testable import Home

class HomeTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberOfCategoriesInHomeScreen() {
        Service.shared.fetchCategories { (result) in
            switch result{
            case .success(let categories):
                let home = HomePage()
                home.setDataSourceWith(categories: categories)
                // There is only one category so there must be only one cell in home screen
                XCTAssertEqual(categories.count, home.collectionView.numberOfItems(inSection: 0))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
