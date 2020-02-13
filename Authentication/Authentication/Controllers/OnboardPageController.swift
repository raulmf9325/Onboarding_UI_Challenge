//
//  PageController.swift
//  Onboarding
//
//  Created by Raul Mena on 2/5/20.
//  Copyright © 2020 Raul Mena. All rights reserved.
//

import UIKit

protocol OnboardPageControllerDelegate{
    func onboardDidFinish()
}

class OnboardPageController: UIViewController{
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let frame = view.frame
        dataSource = OnboardPagesDataSource(cellId: cellId)
        self.view = OnboardPageControllerView(collectionViewDelegate: self,
                                              collectionViewDataSource: dataSource,
                                              navigationDelegate: self,
                                              frame: frame)
    }
    
    /**
     Stored Properties
     */
    var onboardPageControllerDelegate: OnboardPageControllerDelegate?
    private let cellId = "OnboardPageCellId"
    private var currentPageIndex: Int = 0
    private var dataSource: OnboardPagesDataSource!
}

extension OnboardPageController: OnboardNavigationDelegate{
    func onboardDidFinish() {
        onboardPageControllerDelegate?.onboardDidFinish()
    }
    
    func scrollToNextPage() {
        if currentPageIndex < dataSource.pages.count - 1{
            guard let view = self.view as? OnboardPageControllerView else {return}
            view.scrollToNextPage(pageIndex: currentPageIndex + 1)
            currentPageIndex += 1
            updateView()
        }
        else{
            onboardDidFinish()
        }
    }
}

extension OnboardPageController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        //  return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        guard let view = self.view as? OnboardPageControllerView else {return}
        view.updatePageControlIndicator(currentPage: pageNumber)
        currentPageIndex = pageNumber
        updateView()
    }
}

extension OnboardPageController{
    private func updateView(){
        guard let view = self.view as? OnboardPageControllerView else {return}
        if currentPageIndex == dataSource.pages.count - 1{
            view.updateView(isLastPage: true)
        }
        else{
            view.updateView(isLastPage: false)
        }
    }
}



