//
//  HomeScreen.swift
//  Onboarding
//
//  Created by Raul Mena on 2/4/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

class HomePage: UIViewController{

    override func viewDidLoad() {
        collectionView.frame = view.frame
        let homeView = HomePageView(frame: view.frame, collectionView: collectionView)
        self.view = homeView
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setDataSourceWith(categories: [Category]){
        dataSource = CategoriesDataSource(cellId: cellId, categories: categories)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.reloadData()
    }
    
    /**
     stored properties
     */
    private var dataSource: CategoriesDataSource?
    private let cellId = "CellId"
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        return cv
    }()
}

extension HomePage: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = collectionView.frame.width
        let screenHeight = collectionView.frame.height
        let horizontalPadding = screenWidth / 23.4
        let width = screenWidth - 2 * horizontalPadding
        let height = screenHeight / 8.64
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let screenHeight = collectionView.frame.height
        let navigationBarHeight = screenHeight / 7.0
        let topInset = navigationBarHeight
        return UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let screenHeight = collectionView.frame.height
        let spacing = screenHeight / 38.7
        return spacing
    }
}
