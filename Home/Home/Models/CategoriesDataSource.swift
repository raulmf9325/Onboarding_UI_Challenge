//
//  CategoriesDataSource.swift
//  Onboarding
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

/**
 Reusable Categories Data Source for Collection Views
 */

class CategoriesDataSource: NSObject, UICollectionViewDataSource{
    
    private var categories: [Category]
    private var cellId: String
    
    init(cellId: String, categories: [Category]){
        self.cellId = cellId
        self.categories = categories
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryCell
        cell.category = categories[indexPath.item]
        
        return cell
    }
}

