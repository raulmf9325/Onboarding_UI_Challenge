//
//  OnboardPagesDataSource.swift
//  Onboarding
//
//  Created by Raul Mena on 2/9/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

/**
 Reusable Data Source for Collection Views
 */
class OnboardPagesDataSource: NSObject, UICollectionViewDataSource{
    
    let pages = onboardPages
    private var cellId: String
    
    init(cellId: String){
        self.cellId = cellId
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardPages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! OnboardPageCell
        cell.model = onboardPages[indexPath.item]
        
        return cell
    }
}
