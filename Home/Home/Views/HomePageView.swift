//
//  HomeView.swift
//  Onboarding
//
//  Created by Raul Mena on 2/10/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

class HomePageView: UIView{
    
    init(frame: CGRect, collectionView: UICollectionView) {
        super.init(frame: frame)
        addSubview(collectionView)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        backgroundColor = .white
        addNavigationBar()
    }
    
    private func addNavigationBar(){
        let screenWidth = frame.width
        let screenHeight = frame.height
        let height = screenHeight / 7
        
        let navigationBarFrame = CGRect(x: 0, y: 0, width: screenWidth, height: height)
        let navigationBar = NavigationBar(frame: navigationBarFrame)
        addSubview(navigationBar)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: topAnchor),
            navigationBar.leftAnchor.constraint(equalTo: leftAnchor),
            navigationBar.rightAnchor.constraint(equalTo: rightAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
