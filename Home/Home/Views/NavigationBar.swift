//
//  NavigationBar.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

class NavigationBar: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        barWidth = frame.width
        barHeight = frame.height
        
        backgroundColor = .blue
        addMenuButton()
        addPlusButton()
        addCategoryLabel()
        setGradient()
    }
    
    func addMenuButton(){
        addSubview(menuButton)
        let leftPadding = barWidth / 23
        let width = barWidth / 17.8
        let height = barHeight / 11.5
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButton.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPadding),
            menuButton.topAnchor.constraint(equalTo: centerYAnchor),
            menuButton.heightAnchor.constraint(equalToConstant: height),
            menuButton.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func addPlusButton(){
        addSubview(plusButton)
        let rightPadding = barWidth / 23
        let width = barWidth / 18
        let height = width
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightPadding),
            plusButton.topAnchor.constraint(equalTo: menuButton.topAnchor, constant: -(height/4)),
            plusButton.heightAnchor.constraint(equalToConstant: height),
            plusButton.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func addCategoryLabel(){
        addSubview(categoryLabel)
        let width = barWidth / 2
        let height = barHeight / 6
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight < 700{
            categoryLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        }
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryLabel.topAnchor.constraint(equalTo: menuButton.topAnchor, constant: -(height/4)),
            categoryLabel.heightAnchor.constraint(equalToConstant: height),
            categoryLabel.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    func setGradient(){
        let colorOne = UIColor(red: 252/255, green: 182/255, blue: 159/255, alpha: 1)
        let colorTwo = UIColor(red: 255/255, green: 236/255, blue: 210/255, alpha: 1)
        setBackgroundGradient(colorOne: colorOne, colorTwo: colorTwo)
    }
    
    /**
     stored properties
     */
    private var barWidth: CGFloat!
    private var barHeight: CGFloat!
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menuButton"), for: .normal)
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        return button
    }()
    
    let categoryLabel = getLabel(text: "Category", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "HelveticaNeue-Bold", size: 16), textColor: .white, textAlignment: .center)
}
