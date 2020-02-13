//
//  ViewController.swift
//  Onboarding
//
//  Created by Raul Mena on 2/4/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit


class OnboardPageCell: UICollectionViewCell{
    
    var model: OnboardPage!{
        didSet{
            setupViews()
        }
    }
    
    func setupViews(){
        backgroundColor = .white
        addSubviews()
        addConstraints()
    }
    
    func addSubviews(){
        [bottomLabel, middleLabel, topLabel, image].forEach { (subview) in
            addSubview(subview)
        }
       
        screenWidth = safeAreaLayoutGuide.layoutFrame.width
        screenHeight = safeAreaLayoutGuide.layoutFrame.height
    }
    
    func addConstraints(){
        addIllustration()
        addTopLabel()
        addMiddleLabel()
        addBottomLabel()
    }
    
    func addBottomLabel(){
        let leftPadding = screenWidth / 5.0
        let rightPadding = leftPadding
        let topPadding = (screenHeight > 700) ? frame.height / 1.47 : frame.height / 1.5
        let height = screenHeight / 12.3
        
        bottomLabel.text = model.bottomText
        bottomLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: 0, right: rightPadding))
        
        if screenHeight < 700{
            bottomLabel.font = UIFont(name: "Roboto-Regular", size: 13)
        }
    }
    
    func addMiddleLabel(){
        let topPadding = frame.height / 38.6
        let height = screenHeight / 12.3
        
        middleLabel.text = model.middleText
        middleLabel.anchor(top: topLabel.bottomAnchor, leading: topLabel.leadingAnchor, trailing: topLabel.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
    }
    
    func addTopLabel(){
        let topPadding = screenHeight / 18
        let leftPadding = screenWidth / 12.93
        let rightPadding = leftPadding
        let topLabelHeight = screenHeight / 37
        
        topLabel.text = model.topText
        topLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, height: topLabelHeight, padding: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: 0, right: rightPadding))
        
        if screenHeight < 700 {topLabel.font = UIFont(name: "Roboto-Regular", size: 15)}
    }
    
    func addIllustration(){
        let topPadding = frame.height / 3.1
        let leftPadding = screenWidth / 8.426
        let rightPadding = leftPadding
        let height = screenHeight / 3.6
        
        image.image = model.illustration
        image.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, height: height, padding: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: 0, right: rightPadding))
    }
    
    /**
            stored properties
     */
    private var screenWidth: CGFloat! // frame.width
    private var screenHeight: CGFloat! // frame.height
    
    private let image: UIImageView = {
        let image = UIImage(named: "Illustration")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let topLabel = getLabel(text: "Create an account", adjustsToWidth: nil, numberOfLines: nil, font: UIFont(name: "Roboto-Regular", size: 17), textColor: .topPurple, textAlignment: nil)
    
    private let middleLabel = getLabel(text: "Connect with people around the world", adjustsToWidth: true, numberOfLines: 2, font: UIFont(name: "ProximaNova-Bold", size: 36), textColor: .middlePurple, textAlignment: nil)
    
    private let bottomLabel = getLabel(text: "Users will be able to go live, chat and meet with people near by.", adjustsToWidth: true, numberOfLines: 3, font: UIFont(name: "Roboto-Regular", size: 15), textColor: .bottomPurple, textAlignment: .center)
}


