//
//  OnboardPageControllerView.swift
//  Onboarding
//
//  Created by Raul Mena on 2/9/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

protocol OnboardNavigationDelegate{
    func onboardDidFinish()
    func scrollToNextPage()
}

class OnboardPageControllerView: UIView{
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(collectionViewDelegate: UICollectionViewDelegate, collectionViewDataSource: UICollectionViewDataSource, navigationDelegate: OnboardNavigationDelegate, frame: CGRect){
        super.init(frame: .zero)
        self.collectionViewDelegate = collectionViewDelegate
        self.collectionViewDataSource = collectionViewDataSource
        self.navigationDelegate = navigationDelegate
        self.frame = frame
        setupSubViews()
    }
    
    private func setupSubViews(){
        screenHeight = frame.height
        screenWidth = frame.width
        
        setupCollectionView()
        addPageControl()
        addBottomViews()
    }
    
    private func setupCollectionView(){
        addSubview(collectionView)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        collectionView.register(OnboardPageCell.self, forCellWithReuseIdentifier: cellId)
        
        guard let collectionViewDelegate = collectionViewDelegate else {return}
        guard let collectionViewDataSource = collectionViewDataSource else {return}
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
    }
    
    private func addPageControl(){
        addSubview(pageControl)
        let topPadding = frame.height / 1.29
        let width = screenWidth / 12.5
        let height = screenHeight / 135.3

        pageControl.anchor(top: topAnchor, height: height, width: width, centerX: centerXAnchor, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
    }
    
    private func addBottomViews(){
        if isLastPage{
            addGetStartedButton()
        }
        else{
            addSkipButton()
            addNextButton()
        }
    }
    
    private func addNextButton(){
        addSubview(nextButton)
        let topPadding = frame.height / 1.11
        let rightPadding = screenWidth / 5.76
        let height = screenHeight / 42.74
        let width = screenWidth / 9
        
        nextButton.anchor(top: topAnchor, trailing: trailingAnchor, height: height, width: width, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: rightPadding))
        
        nextButton.addTarget(self, action: #selector(handleTapOnNext), for: .touchUpInside)
    }
    
    private func addSkipButton(){
        addSubview(skipButton)
        let topPadding = frame.height / 1.11
        let leftPadding = screenWidth / 5.76
        let height = screenHeight / 42.74
        let width = screenWidth / 9
        
        skipButton.anchor(top: topAnchor, leading: leadingAnchor, height: height, width: width,padding: UIEdgeInsets(top: topPadding, left: leftPadding, bottom: 0, right: 0))
        
        skipButton.addTarget(self, action: #selector(handleTapOnSkip), for: .touchUpInside)
    }
    
    private func addGetStartedButton(){
        addSubview(getStartedButton)
        let topPadding = frame.height / 1.14
        let height = screenHeight / 16.24
        let width = screenWidth / 2.5
        
        getStartedButton.anchor(top: topAnchor, height: height, width: width, centerX: centerXAnchor, padding: UIEdgeInsets(top: topPadding, left: 0, bottom: 0, right: 0))
        
        if screenHeight < 700 {
            getStartedButton.layer.cornerRadius = 20
        }
        
        getStartedButton.addTarget(self, action: #selector(handleTapOnSkip), for: .touchUpInside)
    }
    
    @objc private func handleTapOnSkip(){
        navigationDelegate?.onboardDidFinish()
    }
    
    @objc private func handleTapOnNext(){
        navigationDelegate?.scrollToNextPage()
    }
    
    func scrollToNextPage(pageIndex: Int){
        let nextPage = IndexPath(item: pageIndex, section: 0)
        collectionView.scrollToItem(at: nextPage, at: UICollectionView.ScrollPosition.right, animated: true)
        updatePageControlIndicator(currentPage: pageIndex)
    }
    
    func updatePageControlIndicator(currentPage: Int){
        pageControl.currentPage = currentPage
    }
    
    func updateView(isLastPage: Bool){
        if self.isLastPage == isLastPage {return}
        
        UIView.animate(withDuration: 0.1, animations: {
            if isLastPage{
                self.skipButton.alpha = 0
                self.nextButton.alpha = 0
            }
            else{
                self.getStartedButton.alpha = 0
            }
        }) { (_) in
            if isLastPage{
                self.skipButton.removeFromSuperview()
                self.nextButton.removeFromSuperview()
                self.skipButton.alpha = 1
                self.nextButton.alpha = 1
            }
            else{
                self.getStartedButton.removeFromSuperview()
                self.getStartedButton.alpha = 1
            }
        }
        
        self.isLastPage = isLastPage
        addBottomViews()
    }
    
    /**
     Stored properties
     */
    
    private var collectionViewDelegate: UICollectionViewDelegate?
    private var collectionViewDataSource: UICollectionViewDataSource?
    private var navigationDelegate: OnboardNavigationDelegate?
    
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!
    
    private var isLastPage: Bool = false
    
    private let cellId = "OnboardPageCellId"
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        return cv
    }()
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.currentPage = 0;
        control.numberOfPages = 3;
        control.currentPageIndicatorTintColor = UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1)
        control.pageIndicatorTintColor = UIColor(red: 181/255, green: 187/255, blue: 223/255, alpha: 1)
        return control
    }()
    
    let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("SKIP", for: .normal)
        button.setTitleColor(UIColor(red: 103/255, green: 116/255, blue: 149/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 15)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 15)
        return button
    }()
    
    let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitle("GET STARTED", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 15)
        button.backgroundColor = UIColor(red: 108/255, green: 99/255, blue: 255/255, alpha: 1)
        button.layer.cornerRadius = 25
        return button
    }()
}
