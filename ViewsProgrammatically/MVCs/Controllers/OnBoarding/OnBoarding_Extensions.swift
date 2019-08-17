//
//  OnBoarding_Extensions.swift
//  ViewsProgrammatically
//
//  Created by Jesus Santiago Carrasco Campa on 8/16/19.
//  Copyright © 2019 Techson. All rights reserved.
//

import UIKit

extension OnBoardingController{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            let index = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }, completion: nil)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
}
