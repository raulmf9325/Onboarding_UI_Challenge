//
//  BaseCell.swift
//  Onboarding
//
//  Created by Raul Mena on 2/4/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell{
    
    var category: Category?{
        didSet{
            updateCell()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateCell(){
        guard let category = category else {return}
        categoryImage.image = category.image
        categoryLabel.text = category.categoryName
        tasksLabel.text = "\(category.numberOfTasks) Tasks"
    }
    
    private func setupViews(){
        cellWidth = frame.width
        cellHeight = frame.height
        
        setupCellView()
        addCategoryImage()
        addCategoryLabel()
        addTasksLabel()
        addMoreButton()
    }
    
    private func setupCellView(){
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    private func addCategoryImage(){
        addSubview(categoryImage)
        let imageHeight = cellHeight / 2.67
        let imageWidth = imageHeight
        let leftPadding = cellWidth / 16
        categoryImage.layer.cornerRadius = imageHeight / 2
        
        categoryImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoryImage.leftAnchor.constraint(equalTo: leftAnchor, constant: leftPadding),
            categoryImage.heightAnchor.constraint(equalToConstant: imageHeight),
            categoryImage.widthAnchor.constraint(equalToConstant: imageWidth)
        ])
    }
    
    private func addCategoryLabel(){
        addSubview(categoryLabel)
        let leftPadding = cellWidth / 13
        let width = cellWidth / 2
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight < 700{
            categoryLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 13)
        }
        
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: categoryImage.topAnchor),
            categoryLabel.leftAnchor.constraint(equalTo: categoryImage.rightAnchor, constant: leftPadding),
            categoryLabel.heightAnchor.constraint(equalTo: categoryImage.heightAnchor, multiplier: 0.5),
            categoryLabel.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    private func addTasksLabel(){
        addSubview(tasksLabel)
        
        let screenHeight = UIScreen.main.bounds.height
        if screenHeight < 700{
            tasksLabel.font = UIFont(name: "HelveticaNeue", size: 13)
        }
        
        tasksLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tasksLabel.bottomAnchor.constraint(equalTo: categoryImage.bottomAnchor),
            tasksLabel.leftAnchor.constraint(equalTo: categoryLabel.leftAnchor),
            tasksLabel.heightAnchor.constraint(equalTo: categoryLabel.heightAnchor),
            tasksLabel.widthAnchor.constraint(equalTo: categoryLabel.widthAnchor)
        ])
    }
    
    private func addMoreButton(){
        addSubview(moreButton)
        let topPadding = cellHeight / 4
        let rightPadding = cellWidth / 17
        let width = cellWidth / 13
        let height = cellHeight / 15.6
        
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: topAnchor, constant: topPadding),
            moreButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -rightPadding),
            moreButton.heightAnchor.constraint(equalToConstant: height),
            moreButton.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    /**
     stored properties
     */
    private var cellWidth: CGFloat!
    private var cellHeight: CGFloat!
    
    let categoryImage: UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    let categoryLabel = getLabel(text: "Category", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "HelveticaNeue-Bold", size: 14), textColor: UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1), textAlignment: nil)
    
    let tasksLabel = getLabel(text: "# Tasks", adjustsToWidth: true, numberOfLines: 1, font: UIFont(name: "HelveticaNeue", size: 14), textColor: UIColor(red: 163/255, green: 163/255, blue: 163/255, alpha: 1), textAlignment: nil)
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "moreButton"), for: .normal)
        return button
    }()
    
}
